from flask import Flask, render_template
import random
app = Flask(__name__)


@app.route('/')
def hello_world():
    products = []
    for item in range(12):
        products.append(
            {
                'id': 1,
                'name': 'coca cola',
                'old_price': random.randint(20, 500),
                'discount': random.randint(1, 100),
            },
        )

    return render_template('product_card.html', products=products)

if __name__ == '__main__':
    app.run()
