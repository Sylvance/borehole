class Payments
  class B2CTransaction
    include Interactor

    delegate :initiator, :amount, :party_a, :party_b, to: :context

    before do
      context.fail!(errors: ['The provided parameters are empty']) unless initiator
      timeout_url = ENV['TIMEOUT_URL']
      transaction_url = ENV['TRANSACTION_URL']
      @client.set_urls(timeout_url, transaction_url)
    end

    def call
      context.result = @client.b2c_transaction(initiator, amount, party_a, party_b)
    rescue => e
      context.fail!(error: e.message)
    end
  end
end
