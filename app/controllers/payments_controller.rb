class PaymentsController < ApplicationController
  def new
  end

  def create
    # Get the credit card details submitted bly the form
    token = params[:stripeToken]

    if current_user.customer_id == ''
      customer = Stripe::Customer.create(
          :source => token,
          :plan => 'master',
          :email => 'payinguser@example.com'
      )
      current_user.update(customer_id: customer.id)
    else
      customer = Stripe::Customer.retrieve(current_user.customer_id)
    end

  rescue Stripe::CardError => error
    flash[:error] = error.message
    redirect_to payments_path
  end
end