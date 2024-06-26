import json
from urllib.parse import urlencode
import requests
from datetime import date
from app import app, connection, text, request, render_template, Response
import os
import datetime
import pdfkit


@app.route('/pos')
def indexPos():
    return render_template('pos.html')


@app.route('/pos/create', methods=['post'])
def createPos():
    received_amount = request.form.get('received_amount')
    selected_item = request.form.get('selected_item')
    selected_item_obj = json.loads(selected_item)

    # insert sale transaction
    try:
        # Insert Data to sale
        result = connection.execute(text(f"INSERT INTO sale (date, customer_id, received_amount) VALUES ('2023-12-16', 1, {received_amount})"))
        sale_id = result.lastrowid

        # Insert Data to sale_detail
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
            current_sale_detail = connection.execute(text(
                f"SELECT sale_detail.*, product.name From sale_detail join product on sale_detail.product_id = product.id where sale_id = {sale_id}"))
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

                html = f"<strong>❤️ សរុប:100$</strong>" + "\n"
                html += f"<strong>📝 បានទទួលប្រាក់:{last_sale[0]['received_amount']}$</strong>"
                html_string = html

            html = (
                "<strong>សរុប: {grand_total}</strong>\n"
                "<code>បានទទួលប្រាក់: {received_amount}</code>\n"
                "<code>📆 {date}</code>\n"
                "<code>=======================</code>\n"
                "<code>1. coca 10x0.25</code>\n"
                "<code>2. abc 1x25</code>\n"
            ).format(
                grand_total='1,000$',
                received_amount='100$',
                date=date.today()
                ,
            )

            html = requests.utils.quote(html)

            # Send notification to the request leave employee
            bot_token = "5442577783:AAHqbqmchMEPsNkyllL6zYG73sBdC_1cyHQ"
            chat_id = "756357473"
            config_url = f"https://api.telegram.org/bot{bot_token}/sendMessage?chat_id={chat_id}&text={html}&parse_mode=HTML"
            res = requests.get(config_url)

            return last_sale

    except Exception as e:
        print(f"Error: {e}")
        connection.rollback()

        return {'error': f"{e}"}, 201


@app.route("/pdf")
def index_pdf():
    sale_id = request.args.get('sale_id')
    current_sale = connection.execute(text(f"SELECT * From sale where id ='{sale_id}'"))
    current_sale_detail = connection.execute(text(f"SELECT * From sale where id ='{sale_id}'"))
    for sale in current_sale:
        print(sale)

    path = os.getcwd() + '/pdf/invoice.pdf'
    if not os.path.exists(path):
        os.makedirs(os.getcwd() + '/pdf')

    data = [
        {'id': 1, 'name': 'កូកាកូឡា', 'qty': 20, 'price': 0.25},
        {'id': 1, 'name': 'sting', 'qty': 10, 'price': 0.25},
        {'id': 1, 'name': 'abc', 'qty': 3, 'price': 25},
        {'id': 1, 'name': 'Anchor', 'qty': 6, 'price': 25},
        {'id': 1, 'name': 'KRUD', 'qty': 4, 'price': 25},
        {'id': 1, 'name': 'VATANAK', 'qty': 1, 'price': 25},
        {'id': 1, 'name': 'DRAGON', 'qty': 2, 'price': 25},
    ]

    created_at = '2024-01-02'
    server_url = request.url_root
    html = render_template("invoice.html", data=data, now=created_at, server_url=server_url)
    options = {
        # 'page-size': 'a7',
        'page-height': '10in',
        'page-width': '3in',
        'margin-top': '0.1in',
        'margin-right': '0in',
        'margin-bottom': '0.1in',
        'margin-left': '0in',
    }
    pdf = pdfkit.from_string(html, path, options)
    pdf_preview = pdfkit.from_string(html, '', options)

    return Response(pdf_preview, mimetype="application/pdf")
