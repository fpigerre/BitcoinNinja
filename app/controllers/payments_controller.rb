class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.plan != nil
      redirect_to user_root_path
    end
  end

  def create
    # Email does not have to be the same as registered email
    if current_user.customer_id == ''
      customer = Stripe::Customer.create(
          :source => params[:stripeToken],
          :plan => params[:account_type],
          :email => params[:stripeEmail]
      )
      current_user.update(customer_id: customer.id)
      current_user.update(plan: params[:account_type])
      current_user.update(plan_expiry: Time.now + 1.month)
    else
      customer = Stripe::Customer.retrieve(current_user.customer_id)
    end

  rescue Stripe::CardError => error
    flash[:error] = error.message
    redirect_to payments_path
  end
end