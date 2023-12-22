import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
from sklearn.preprocessing import StandardScaler
import datetime as date


def create_df(file_name: str, num_poubelle: int, village: str) -> pd.DataFrame:
    data = pd.read_excel(file_name, sheet_name=village)
    df = pd.DataFrame({
        'date': data['Unnamed: 1'],
        'remplissage': data[f'Unnamed: {num_poubelle*3}'][1:].astype(float),
        'coeff': data[f'Unnamed: {num_poubelle*3+1}'][1:].astype(float)
    }).dropna()
    return df


def create_model(df: pd.DataFrame) -> LinearRegression:
    for i in range(3, 6):
        df[f'remplissage_{i}d_ago'] = df['remplissage'].shift(i).fillna(0)

    X = df.drop(['date', 'remplissage'], axis=1)
    y = df['remplissage']

    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)

    model = LinearRegression()
    model.fit(X_scaled, y)

    return model


def train_model(df: pd.DataFrame, date_: date.datetime) -> bool:
    future_date = pd.to_datetime(date_)
    features_future = [df.loc[df['date'] == future_date - date.timedelta(days=i), 'remplissage'].values[0]
                       for i in range(3, 6) if len(df.loc[df['date'] == future_date - date.timedelta(days=i), 'remplissage']) > 0]

    if not features_future:
        print("No past data available for scaling and prediction.")
        return False

    last_emptied_index = df[df['remplissage'] == 0].index[-1]
    index_date = df[df['date'] == date_].index[0]

    if df['remplissage'][index_date] >= 75:
        print("Condition 1: True")
        return True
    elif df['coeff'][index_date] == 3:
        print("Condition 2: True")
        return True
    elif df['coeff'][index_date] == 2 and df.loc[last_emptied_index - 1, 'remplissage'] != 0:
        print("Condition 3: True")
        return True
    elif df['coeff'][index_date] == 1:
        last_emptied_date = df.loc[last_emptied_index, 'date']
        rate_of_increase = df.loc[(df['date'] >= last_emptied_date) & (
            df['date'] <= date_), 'remplissage']
        if df['remplissage'][index_date] >= 50 and rate_of_increase.sum() > 20:
            print("Condition 4: True")
            return True

    print("No condition met.")
    return False


def test_poubelle(num_poubelle: int, village: str) -> bool:
    df = create_df("back-end/Taux_Remplissage_ComCom_Nebbiu.xlsx",
                   num_poubelle, village)
    model = create_model(df)
    return train_model(df, model, date.datetime(2023, 1, 26))
