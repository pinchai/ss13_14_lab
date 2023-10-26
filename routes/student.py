from app import app, render_template
import sqlite3


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
