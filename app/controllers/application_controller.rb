class ApplicationController < ActionController::Base
  require 'mpesa_connect'

  def client
    key = ENV["MPESA_KEY"] || "MPESA_KEY"
    secret = ENV["MPESA_SECRET"] || "MPESA_SECRET"
    security_password = ENV["MPESA_SECURITY_PASSWORD"] || "MPESA_SECURITY_PASSWORD"
    timeout_url = "https://borehole-payments.herokuapp.com/transactions/timeout"
    transaction_url = "https://borehole-payments.herokuapp.com/transactions/transation"
    confirmation_url = "https://borehole-payments.herokuapp.com/transactions/confirmation"
    validation_url = "https://borehole-payments.herokuapp.com/transactions/validation"

    client = MpesaConnect::Client.new(key, secret, security_password)
    client.set_urls(timeout_url, transaction_url, confirmation_url, validation_url) 
  end
end
