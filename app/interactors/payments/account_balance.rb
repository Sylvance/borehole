class Payments
  class AccountBalance
    include Interactor

    delegate :initiator, :party_a, to: :context

    before do
      context.fail!(errors: ['The provided parameters are empty']) unless initiator
      timeout_url = ENV['TIMEOUT_URL']
      transaction_url = ENV['TRANSACTION_URL']
      @client.set_urls(timeout_url, transaction_url)
    end

    def call
      context.result = @client.account_balance(initiator, party_a)
    rescue => e
      context.fail!(error: e.message)
    end
  end
end
