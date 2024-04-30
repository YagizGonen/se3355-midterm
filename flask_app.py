import os

import mysql.connector
from flask import Flask, redirect, render_template, request, url_for
from mysql.connector import MySQLConnection
from mysql.connector.abstracts import MySQLConnectionAbstract
from mysql.connector.pooling import PooledMySQLConnection

db_host = 'localhost'
db_name = 'app'
db_user = 'root'
db_password = 'root'
_connection: MySQLConnection = MySQLConnection()

app = Flask(__name__)


def init_db():
   conn = get_connection()
   for query in open("schema.sql", "r").read().split(';'):
      conn.cursor().execute(query)
      conn.commit()


def get_connection() -> PooledMySQLConnection | MySQLConnectionAbstract:
    global _connection
    if not _connection.is_connected():
        _connection = mysql.connector.connect(host=db_host, database=db_name,
                                              user=db_user, password=db_password)
    return _connection


@app.route('/')
def index():
    cursor = get_connection().cursor()
    cursor.execute("SELECT * FROM campaign")
    campaigns = cursor.fetchall()
    return render_template('index.html', categories=get_categories(),
                           campaigns=campaigns,)


@app.route('/search')
def search():
    keyword = request.args.get("keyword")
    category = request.args.get("category")
    cursor = get_connection().cursor()

    # Base query
    product_query = """
    SELECT DISTINCT p.* FROM product p
    """

    # Conditionally join and add conditions based on inputs
    where_clauses = []
    params = []

    if keyword:
        where_clauses.append("""
        LOWER(CONCAT_WS(' ', 
            IFNULL(p.name, ''), 
            IFNULL(p.image, ''), 
            IFNULL(p.location, ''), 
            IFNULL(p.colors, '')
        )) LIKE %s
        """)
        params.append(f"%{keyword.lower()}%")

    if category:
        product_query += "JOIN category c ON p.category_id = c.id "
        where_clauses.append("p.category_id = %s")
        params.append(category)

    if where_clauses:
        product_query += "WHERE " + " AND ".join(where_clauses)

    cursor.execute(product_query, params)
    products = cursor.fetchall()
    categories = []

    if len(products) != 0:
        placeholders = ','.join(['%s'] * len(products))
        category_query = f"SELECT DISTINCT name FROM category WHERE id IN ({placeholders})"
        cursor.execute(category_query, [p[0] for p in products])
        categories = cursor.fetchall()

    return render_template('search.html', categories=get_categories(),
                           result_products=products, result_categories=categories)


@app.route('/product/<id>')
def product(id):
    cursor = get_connection().cursor()
    cursor.execute("SELECT * FROM product WHERE id = %s", (id,))
    product = cursor.fetchone()
    return render_template('product.html', categories=get_categories(),
                           product=product)

def get_categories():
    cursor = get_connection().cursor()
    cursor.execute("SELECT * FROM category")
    return cursor.fetchall()


init_db()

if __name__ == '__main__':
    app.run()
