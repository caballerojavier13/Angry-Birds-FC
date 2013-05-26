class PasswordController < ApplicationController
  def edit
    @persona = Persona.find(params[:id])
    if params[:codigo] != @persona.codigo
      redirect_to "/invalid_code" 
    else
      session[:persona]=@persona.id
    end
  end
  def update
    if (session[:password]) != nil
      @persona=Persona.find(session[:persona])
      @persona.password= session[:password]
      @persona.save
      session[:persona] = nil
      session[:password] = nil
      session[:repassword] = nil
      redirect_to "/login"
    end
  end
end
