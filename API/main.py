import flask
from connection import get_riders_from_db,get_top_riders_from_db,get_top_providers_from_db,get_top_riders_by_ratings_from_db
from flask_cors import CORS,cross_origin


app = flask.Flask(__name__)
app.config["DEBUG"] = True
cors = CORS(app)
app.config['CORS_HEADERS'] = 'application/json'


@app.route('/riders', methods=['GET'])
def get_riders():
    result = get_riders_from_db()
    return result

@app.route('/topriders', methods=['GET'])
def get_top_riders():
    result = get_top_riders_from_db()
    return result

@app.route('/topproviders', methods=['GET'])
def get_top_providers():
    result = get_top_providers_from_db()
    return result

@app.route('/topridersratings', methods=['GET'])
def get_top_riders_by_ratings():
    result = get_top_riders_by_ratings_from_db()
    return result

#close_connection()
app.run()