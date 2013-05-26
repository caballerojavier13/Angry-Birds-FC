class ApplicationController < ActionController::Base
  #before_filter :authorize
  protect_from_forgery

  private


  # ...

  protected

  def authorize
    if User.find_by_id(session[:user_id])
      redirect_to "/admin/index"
    end

  end
end