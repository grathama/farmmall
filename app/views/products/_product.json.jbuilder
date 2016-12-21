json.extract! product, :id, :name, :description, :town, :price, :phone_number, :created_at, :updated_at
json.url product_url(product, format: :json)