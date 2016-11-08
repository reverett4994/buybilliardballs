json.extract! order, :id, :price, :ship_street, :ship_city, :ship_state, :ship_zip, :shipping, :created_at, :updated_at
json.url order_url(order, format: :json)