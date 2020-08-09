class Payments
  class Reversal
    include Interactor

    delegate :initiator, :transaction_id, :amount, :receiver_party, to: :context

    before do
      context.fail!(errors: ['The provided parameters are empty']) unless initiator
      timeout_url = ENV['TIMEOUT_URL']
      transaction_url = ENV['TRANSACTION_URL']
      @client.set_urls(timeout_url, transaction_url)
    end

    def call
      context.result = @client.reversal(initiator, transaction_id, amount, receiver_party)
    rescue => e
      context.fail!(error: e.message)
    end
  end
end
