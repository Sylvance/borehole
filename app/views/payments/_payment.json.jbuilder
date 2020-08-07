json.extract! payment, :id, :mpesa_code, :user_id, :transacted, :timed_out, :created_at, :updated_at
json.url payment_url(payment, format: :json)
