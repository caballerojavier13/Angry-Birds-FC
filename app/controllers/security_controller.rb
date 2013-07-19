class SecurityController < ApplicationController
  before_filter :authorize
  def authorize
    unless Persona.find_by_id(session[:usuario_id])
      redirect_to "/login", :alert => "Por favor inicie sesion."
    end
  end
  
  private
  
  def only_admin
    redirect_to "/start", :alert => "Acceso no autorizado."
  end
  
  def only_owner_and_admin
    redirect_to "/start", :alert => "Acceso no autorizado."
  end  
end
