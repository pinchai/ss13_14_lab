from app import app, render_template
import sqlite3


@app.route('/admin/category')
def indexCategory():

    return render_template('admin/category/index.html', module='category')


@app.route('/admin/add_category')
def addCategory():
    return render_template('admin/category/add.html')
