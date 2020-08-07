require 'test_helper'

class TransactionControllerTest < ActionDispatch::IntegrationTest
  test "should get timeout" do
    get transaction_timeout_url
    assert_response :success
  end

  test "should get transaction" do
    get transaction_transaction_url
    assert_response :success
  end

  test "should get confirmation" do
    get transaction_confirmation_url
    assert_response :success
  end

  test "should get validation" do
    get transaction_validation_url
    assert_response :success
  end

end
