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
    @persona = Persona.find(session[:persona])
  	if (params[:password]).size < 4
  	  redirect_to "/password/" + (@persona.id).to_s + "?codigo=" + @persona.codigo, :alert => "La contraseña debe tener más de 3 caracteres." 
  	else
  	  pass = params[:password]
      repass = params[:password_confirmation]
  		if (pass.casecmp repass)
  			@persona.cambiar_pass params[:password]
  			session[:persona]= nil
  			redirect_to "/login", :alert => "Contraseña cambiada con éxito."
  		else	
  			redirect_to "/password/" + (@persona.id).to_s + "?codigo=" + @persona.codigo, :alert => "Las contraseñas ingresadas no coinciden." 
  		end    
	  end
  end
end
