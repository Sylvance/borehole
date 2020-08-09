class ApplicationController < ActionController::Base
  require 'mpesa_connect'

  def client
    key = ENV["MPESA_KEY"]
    secret = ENV["MPESA_SECRET"]
    security_password = ENV["MPESA_SECURITY_PASSWORD"]

    @client = MpesaConnect::Client.new(key, secret, security_password)
  end
end
