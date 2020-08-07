class ApplicationController < ActionController::Base
  require 'mpesa_connect'

  def client
    key = ENV["MPESA_KEY"] || "MPESA_KEY"
    secret = ENV["MPESA_SECRET"] || "MPESA_SECRET"
    security_password = ENV["MPESA_SECURITY_PASSWORD"] || "MPESA_SECURITY_PASSWORD"

    client = MpesaConnect::Client.new(key, secret, security_password)
  end

  def timeout_url
    timeout_url = ENV["TIMEOUT_URL"] || "TIMEOUT_URL"
  end

  def transaction_url
    transaction_url = ENV["TRANSACTION_URL"] || "TRANSACTION_URL"
  end

  def confirmation_url
    confirmation_url = ENV["CONFIRMATION_URL"] || "CONFIRMATION_URL"
  end

  def validation_url
    validation_url = ENV["VALIDATION_URL"] || "VALIDATION_URL"
  end
end
