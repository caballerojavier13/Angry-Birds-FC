class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new

  end

  def create
    if params[:mail] == nil
	if params[:username] != nil
	    @persona = Persona.authenticate(params[:username], params[:password])
	    if !(@persona.nil?)
	      if @persona.activo
      		session[:usuario_id] = @persona.id
      		session[:genero] = @persona.genero
		      cookies.permanent[:usuario_id] = @persona.id
		      cookies.permanent[:genero] = @persona.genero
      		redirect_to "/start"
	      else
		      redirect_to "/login", :alert => "Usuario inactivo."
	      end
	    else
	      redirect_to "/login", :alert => "Verifique los datos ingresados."
	    end
	end
    else
    	session[:mail] = params[:mail]
    	params[:mail] = nil
    	redirect_to "/change_password"
    end
  end
  def inicio
    if session[:usuario_id] != nil
	    if Persona.find(session[:usuario_id])
		    redirect_to "/start"
	    else
	      redirect_to "/login"			
      end
    else
	    if cookies.permanent[:usuario_id] != 0
    		session[:usuario_id] = cookies.permanent[:usuario_id]
        session[:genero] = cookies.permanent[:genero]
    		if Persona.find(session[:usuario_id])
    			redirect_to "/start"
    		else
    			redirect_to "/login"			
       	end
	    else
	      redirect_to "/login"
	    end
    end
  end
  
  def destroy
    session[:usuario_id] = nil
    session[:genero] = nil
    cookies.permanent[:usuario_id] = 0
    cookies.permanent[:genero] = nil
    redirect_to "/login"
  end
end
