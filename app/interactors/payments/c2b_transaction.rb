class Payments
  class C2BTransaction
    include Interactor

    delegate :shortcode, :amount, :msisdn, :bill_reference, to: :context

    before do
      context.fail!(errors: ['The provided parameters are empty']) unless shortcode
      confirmation_url = ENV['CONFIRMATION_URL']
      validation_url = ENV['VALIDATION_URL']
      @client.set_urls(nil, nil, confirmation_url, validation_url)
      @client.c2b_register_url(shortcode, response_type) # response_type is either 'Cancelled' or 'Completed'
    end

    def call
      context.result = @client.c2b_transaction(shortcode, amount, msisdn, bill_reference)
    rescue => e
      context.fail!(error: e.message)
    end
  end
end
