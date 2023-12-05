from app import app, connection, text, request, render_template


@app.route('/pos')
def indexPos():
    return render_template('pos.html')
