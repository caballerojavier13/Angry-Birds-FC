#coding: utf-8
class PasswordController < ApplicationController
  
  def edit
    @persona = Persona.find(params[:id])
    if params[:codigo] != @persona.codigo
      redirect_to "/invalid_code"
    else
      session[:persona]=@persona.id
      session[:codigo] = params[:codigo]
    end
  end
  
  def update
    @persona = Persona.find(params[:id])
  	if (params[:password]).size < 4
  	  redirect_to "/password/" + (@persona.id).to_s + "?=" + @persona.codigo, :alert => "La contraseña debe tener más de 3 caracteres." 
  	else
  		if (params[:password]) == (params[:repassword])
  			@persona.cambiar_pass params[:password]
  			redirect_to "/login"
  		else	
  			redirect_to "/password/" + (@persona.id).to_s + "?=" + @persona.codigo, :alert => "Las contraseñas ingresadas no coinciden." 
  		end    
	  end
  end
end
