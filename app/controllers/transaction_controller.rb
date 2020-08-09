class TransactionController < ApplicationController
  def timeout
    respond_to do |format|
      if @payment.update(payment_params)
        format.json { render json: { payment: @payment.to_h }, status: :ok }
      else
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def transaction
    respond_to do |format|
      if @payment.update(payment_params)
        format.json { render json: { payment: @payment.to_h }, status: :ok }
      else
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirmation
    respond_to do |format|
      if @payment.update(payment_params)
        format.json { render json: { payment: @payment.to_h }, status: :ok }
      else
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  def validation
    respond_to do |format|
      if @payment.update(payment_params)
        format.json { render json: { payment: @payment.to_h }, status: :ok }
      else
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:mpesa_code, :user_id, :transacted, :timed_out)
    end
end
