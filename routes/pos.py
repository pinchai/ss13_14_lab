import json
from urllib.parse import urlencode
import requests
from app import app, connection, text, request, render_template


@app.route('/pos')
def indexPos():
    return render_template('pos.html')


@app.route('/pos/create', methods=['post'])
def createPos():
    received_amount = request.form.get('received_amount')
    selected_item = request.form.get('selected_item')
    selected_item_obj = json.loads(selected_item)

    # insert sale transaction
    result = connection.execute(text(f"INSERT INTO sale (date, customer_id, received_amount) VALUES ('2023-12-16', 1, {received_amount})"))
    connection.commit()
    sale_id = result.lastrowid

    for item in selected_item_obj:
        pro_id = item['id']
        qty = item['qty']
        cost = item['cost']
        price = item['price']

        connection.execute(text(f"""
                                INSERT INTO sale_detail (sale_id, product_id, qty ,cost, price) 
                                VALUES ({sale_id}, {pro_id}, {qty}, {cost}, {price})
                                """))
        connection.commit()

    current_sale = connection.execute(text(f"SELECT * From sale where id = {sale_id}"))
    current_sale_detail = connection.execute(text(f"SELECT sale_detail.*, product.name From sale_detail join product on sale_detail.product_id = product.id where sale_id = {sale_id}"))
    connection.commit()

    last_sale = []
    last_sale_detail_obj = []
    for sale_detail in current_sale_detail:
        last_sale_detail_obj.append(
            {
                'id': sale_detail.id,
                'product_id': sale_detail.product_id,
                'product_name': sale_detail.name,
                'qty': sale_detail.qty,
                'cost': sale_detail.cost,
                'price': sale_detail.price,

            }
        )

    for sale in current_sale:
        last_sale.append(
            {
                'id': sale.id,
                'date': sale.date,
                'customer_id': sale.customer_id,
                'received_amount': sale.received_amount,
                'sale_detail': last_sale_detail_obj
            }
        )

        html = f"<strong>❤️ សរុប:100$</strong>"+"\n"
        html += f"<strong>📝 បានទទួលប្រាក់:{last_sale[0]['received_amount']}$</strong>"
        html_string = html
    chat_id = ''
    bot_toked = ''
    r = requests.get(f"https://api.telegram.org/bot{bot_toked}/sendMessage?chat_id={chat_id}&text={html_string}&parse_mode=HTML")
    return last_sale
