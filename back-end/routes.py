from app import app
from services import *

@app.route('/')
def hello():
    return 'Hello, World!'

@app.route('/api/')
def x():
    return 'Hello, World!'