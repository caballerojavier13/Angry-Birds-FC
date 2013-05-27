class SecurityController < ApplicationController
  before_filter :authorize
  def authorize
    unless Persona.find_by_id(session[:usuario_id])
      redirect_to "/login", :notice => "Please log in"
    end

  end
end
