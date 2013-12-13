#coding: utf-8
class SecurityController < MasterSecurityController
  before_filter :authorize
  def authorize
    unless cookies[:usuario_id].to_i != 0
      redirect_to "/login", :alert => "Por favor inicie sesion."
    else
      session[:usuario_id] = cookies[:usuario_id].to_i
      session[:genero] = cookies[:genero].to_i
      if Persona.find_by_id(session[:usuario_id]).nil?
        redirect_to "/login", :alert => "Por favor inicie sesion."
      end
    end
  end
end
