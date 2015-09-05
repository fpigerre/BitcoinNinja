class GuidesController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO: Refactor to less-used location
    # TODO: Use hook instead of manual calculation
    # Check whether subscription is still active
    if current_user.plan_expiry != nil
      if current_user.plan_expiry < Time.now
        current_user.update(plan: nil)
        current_user.update(plan_expiry: nil)
      end
    end

    if current_user.plan == nil
      redirect_to new_payment_path
    else
      @guides = Guide.all
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  end

  def show
    @guide = Guide.find_by_name(params[:id])
  end

  def about
    respond_to do |format|
      format.html # about.html.erb
    end
  end
end
