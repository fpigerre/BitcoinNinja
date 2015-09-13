class RegistrationsController < Devise::RegistrationsController
  def show
    @user = User.find_by_username(params[:username])
  end
end