class GuidesController < ApplicationController
  before_action :authenticate_user!

  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def about
    respond_to do |format|
      format.html # about.html.erb
    end
  end
end
