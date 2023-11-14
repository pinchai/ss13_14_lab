from app import app, render_template, connection, text


@app.route('/get_all_product')
def getAllProduct():
    result = connection.execute(text("SELECT * FROM product"))
    product_arr = []
    for item in result:
        product_arr.append(
            {
                'id': item.id,
                'name': item.name,
                'category_id': item.category_id,
                'image': item.image,
                'cost': item.cost,
                'price': item.price,
            }
        )

    return product_arr
