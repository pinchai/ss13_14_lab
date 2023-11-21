from app import app, render_template, connection, text, request
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


@app.route('/get_product_by_filter')
def getProductByFilter():
    txt_src = request.args.get('txt_src')
    result = connection.execute(text(f"SELECT * FROM product where name like '%{txt_src}%'"))
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
