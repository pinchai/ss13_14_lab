from flask import Flask, render_template, request
from sqlalchemy import create_engine, text
import random
import sqlite3

app = Flask(__name__)

engine = create_engine("mysql+mysqlconnector://root:mysql@localhost/ss13.14_pos")
connection = engine.connect()
app.secret_key = 'your secret key'


@app.context_processor
def utility_processor():
    def getBaseUrl():
        return 'http://127.0.0.1:5000'

    def getImagePath():
        return 'http://127.0.0.1:5000/'

    return dict(
        getBaseUrl=getBaseUrl,
        getImagePath=getImagePath
    )


import routes


@app.route('/')
def web():
    result = connection.execute(text("SELECT * FROM product"))
    return render_template('product_card.html', products=result)


@app.route('/detail/<string:id>')
def detail(id):
    return render_template('product_detail.html', id=id)


@app.route('/admin')
def admin():
    return render_template('admin/master.html')


@app.route('/admin/student')
def indexStudent():
    con = sqlite3.connect("database.db")
    con.row_factory = sqlite3.Row
    cur = con.cursor()
    cur.execute("select * from students")
    rows = cur.fetchall()

    return render_template(
        'admin/student/index.html',
        module='student',
        rows=rows
    )


@app.route('/admin/add_student')
def addStudent():
    return render_template('admin/student/add.html')


@app.route('/admin/edit_student/<string:name>')
def editStudent(name):
    con = sqlite3.connect("database.db")
    con.row_factory = sqlite3.Row
    cur = con.cursor()
    cur.execute(f"SELECT * FROM students WHERE name='{name}'")
    row = cur.fetchall()

    return render_template('admin/student/edit.html', row=row)


@app.route('/admin/category')
def indexCategory():
    return render_template('admin/category/index.html', module='category')


@app.route('/admin/add_category')
def addCategory():
    return render_template('admin/category/add.html')


@app.errorhandler(500)
def pageNotFound(e):
    return render_template('500.html')


if __name__ == '__main__':
    app.run()
