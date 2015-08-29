class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to user_root_path
    else
      respond_to do |format|
        format.html # index.html.erb
      end
    end
  end

  def about
    respond_to do |format|
      format.html # about.html.erb
    end
  end
end
