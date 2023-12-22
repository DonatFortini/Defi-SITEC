import pandas as pd
import datetime as date


def create_df(file_name: str, num_poubelle: int, village: str) -> pd.DataFrame:
    data = pd.read_excel(file_name, sheet_name=village)
    df = pd.DataFrame({
        'date': data['Unnamed: 1'][1:] if village != 'casta' else data['poubelle 1'][1:],
        'remplissage': data[f'Unnamed: {num_poubelle*3}'][1:].astype(float),
        'coeff': data[f'Unnamed: {num_poubelle*3+1}'][1:].astype(float)
    }).dropna()
    return df


def last_emptied_index(df: pd.DataFrame, date_: date.datetime) -> int:
    date_index = df[df['date'] == date_].index[0]
    past_date_index = date_index - 5
    while df['remplissage'][past_date_index] != 0:
        past_date_index -= 1
    return past_date_index


def rate_of_increase(df: pd.DataFrame, date_: date.datetime) -> float:
    lei = last_emptied_index(df, date_)
    roi = 0
    compt = 0
    for i in range(lei, df[df['date'] == date_].index[0]):
        roi += df['remplissage'][i]
        compt += 1
    return roi/compt


def train_model(df: pd.DataFrame, date_: date.datetime) -> bool:
    future_date = pd.to_datetime(date_)
    features_future = [df.loc[df['date'] == future_date - date.timedelta(days=i), 'remplissage'].values[0]
                       for i in range(3, 6) if len(df.loc[df['date'] == future_date - date.timedelta(days=i), 'remplissage']) > 0]

    if not features_future:
        print("No past data available for scaling and prediction.")
        return False

    index_date = df[df['date'] == date_].index[0]
    if df['remplissage'][index_date] >= 75:
        print("Condition 1: True")
        return True
    elif df['coeff'][index_date] == 3:
        print("Condition 2: True")
        return True
    elif df['coeff'][index_date] == 2 and last_emptied_index(df, date_)-df[df['date'] == date_].index[0] < 2:
        print("Condition 3: True")
        return True
    elif df['coeff'][index_date] == 1:
        if df['remplissage'][index_date] >= 50 and rate_of_increase(df, date_) > 20:
            print("Condition 4: True")
            return True

    print("No condition met.")
    return False


def test_poubelle(num_poubelle: int, village: str, date_) -> bool:
    df = create_df("back-end/Taux_Remplissage_ComCom_Nebbiu.xlsx",
                   num_poubelle, village)
    return train_model(df, date_)
