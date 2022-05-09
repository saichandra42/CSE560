import mysql.connector
from mysql.connector import Error
from flask import jsonify

connection = mysql.connector.connect(host='localhost',
                                         database='ublyft',
                                         user='root',
                                         password='password')
if connection.is_connected():
    db_Info = connection.get_server_info()
    print("Connected to MySQL Server version ", db_Info)
    cursor = connection.cursor()
    cursor.execute("select database();")
    record = cursor.fetchone()
    print("You're connected to database: ", record)


def close_connection():
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
    

def get_riders_from_db():
    query = "SELECT * from Rider"
    cursor.execute(query)
    records = cursor.fetchall()
    return jsonify(records)


def get_top_riders_from_db():
    query = "SELECT Trip.rider_id, Rider.first_name, Rider.last_name, COUNT(Trip.id) from Trip, Rider WHERE Rider.id = Trip.rider_id GROUP BY Trip.rider_id  HAVING count(Trip.id) > 100 ORDER BY count(Trip.id) DESC;"
    cursor.execute(query)
    records = cursor.fetchall()
    return jsonify(records)

def get_top_providers_from_db():
    query = "SELECT Trip.rider_id, Provider.driver_name, Provider.phone_number, COUNT(Trip.id) from Trip, Provider WHERE Provider.id = Trip.rider_id GROUP BY Trip.rider_id HAVING count(Trip.id) > 100 ORDER BY count(Trip.id) DESC;"
    cursor.execute(query)
    records = cursor.fetchall()
    return jsonify(records)

def get_top_riders_by_ratings_from_db():
    query = "SELECT Provider.driver_name, AVG(Trip.rider_rating) from Trip, Provider WHERE Provider.id = Trip.provider_id GROUP BY Trip.provider_id ORDER By AVG(Trip.rider_rating) DESC;"
    cursor.execute(query)
    records = cursor.fetchall()
    return jsonify(records)