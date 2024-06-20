from flask import Flask, render_template, request, jsonify, Response, json
from sqlalchemy import create_engine, text
from flask_cors import CORS
import sqlite3
from datetime import timedelta
from datetime import datetime

from flask_jwt_extended import create_access_token
# from flask_jwt_extended import current_user
from flask_jwt_extended import get_jwt_identity
from flask_jwt_extended import jwt_required
from flask_jwt_extended import get_jwt
from flask_jwt_extended import unset_jwt_cookies
from flask_jwt_extended import JWTManager

app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})

# Setup the Flask-JWT-Extended extension
app.config["JWT_SECRET_KEY"] = "super-secret"  # Change this!
app.config["JWT_ACCESS_TOKEN_EXPIRES"] = timedelta(hours=24)
jwt = JWTManager(app)

engine = create_engine("mysql+mysqlconnector://root:mysql@localhost:3306/ss13.14_pos")
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


@app.get('/jwt')
def record():
    data = connection.execute(text("SELECT * FROM product"))
    res = []
    for item in data:
        res.append({
            'id': item[0],
            'name': item[1],
        })
    return res


@app.route("/login", methods=["POST"])
def login():
    username = request.form.get("username", None)
    password = request.form.get("password", None)
    if username != "test" or password != "test":
        return jsonify({"msg": "Bad username or password"}), 401

    access_token = create_access_token(
        identity={
            'id': 1,
            'name': 'chai',
        }
    )
    return jsonify(access_token=access_token)


@app.post("/logout")
def logout():
    response = jsonify({"msg": "logout successful"})
    unset_jwt_cookies(response)
    return response


# Protect a route with jwt_required, which will kick out requests
# without a valid JWT present.
@app.route("/protected", methods=["GET"])
@jwt_required()
def protected():
    # Access the identity of the current user with get_jwt_identity
    current_user = get_jwt_identity()
    dt_object = datetime.fromtimestamp(get_jwt()["exp"])
    print(dt_object)
    return jsonify(logged_in_as=current_user), 200
    # return jsonify(
    #     id=current_user.id,
    #     full_name=current_user.full_name,
    #     username=current_user.username,
    # )


@app.route('/')
def web():
    # return f"{timedelta(hours=0.1)}"

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
