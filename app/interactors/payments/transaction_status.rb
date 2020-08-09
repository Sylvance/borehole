class Payments
  class TransactionStatus
    include Interactor

    delegate :initiator, :party_a, :transaction_id, to: :context

    before do
      context.fail!(errors: ['The provided parameters are empty']) unless initiator
      timeout_url = ENV['TIMEOUT_URL']
      transaction_url = ENV['TRANSACTION_URL']
      @client.set_urls(timeout_url, transaction_url)
    end

    def call
      context.result = @client.transaction_status(initiator, party_a, transaction_id)
    rescue => e
      context.fail!(error: e.message)
    end
  end
end
