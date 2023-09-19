from flask import Flask, render_template, request
import random
from essential_generators import DocumentGenerator

app = Flask(__name__)


@app.route('/')
def hello_world():
    filter_category = request.args.get('filter_category', default='all');
    # gen = DocumentGenerator()
    products = []
    categories = [
        {
            'id': 1,
            'name': 'drink',
        },
        {
            'id': 1,
            'name': 'beer',
        },
        {
            'id': 1,
            'name': 'food',
        },
        {
            'id': 1,
            'name': 'water',

        }

    ]
    filter_product = []

    for item in range(14):
        category = random.choice(categories)
        products.append(
            {
                'id': 1,
                'name': 'sting',
                'category': category['name'],
                'old_price': random.randint(20, 500),
                'discount': random.randint(1, 100),
                'description': ''
            },
        )

    for product in products:
        if product['category'] == filter_category:
            filter_product.append(product)
        elif filter_category == 'all' or filter_category == '':
            filter_product = products

    return render_template(
        'product_card.html',
        products=filter_product,
        categories=categories,
        filter_category=filter_category
    )


@app.route('/detail/<string:id>')
def detail(id):
    return render_template('product_detail.html', id=id)


@app.errorhandler(404)
def pageNotFound(e):
    return render_template('404.html')


@app.errorhandler(500)
def pageNotFound(e):
    return render_template('500.html')


if __name__ == '__main__':
    app.run()
