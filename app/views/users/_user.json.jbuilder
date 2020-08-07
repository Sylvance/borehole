json.extract! user, :id, :email, :password, :house_number, :billing, :created_at, :updated_at
json.url user_url(user, format: :json)
