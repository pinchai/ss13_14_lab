from flask import Flask, render_template
import random
from essential_generators import DocumentGenerator
app = Flask(__name__)


@app.route('/')
def hello_world():
    gen = DocumentGenerator()
    products = []
    categories = []
    for item in range(40):
        products.append(
            {
                'id': 1,
                'name': 'coca cola',
                'old_price': random.randint(20, 500),
                'discount': random.randint(1, 100),
                'description': gen.sentence()
            },
        )

    for category in range(10):
        categories.append(
            {
                'id': 1,
                'name': 'coca cola',
            },
        )

    return render_template('product_card.html', products=products, categories=categories)


if __name__ == '__main__':
    app.run()
