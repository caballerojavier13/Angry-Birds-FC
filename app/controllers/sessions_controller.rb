class SessionsController < ApplicationController

  def new

  end

  def create
    if params[:mail] == nil
	if params[:username] != nil
	    @persona = Persona.authenticate(params[:username], params[:password])
	    if !(@persona.nil?)
	      if @persona.activo
          unless @persona.bloqueado

            session[:usuario_id] = @persona.id
            session[:genero] = @persona.genero


            cookies[:usuario_id]= { :value => @persona.id, :expires => 1.week.from_now }
            cookies[:genero] = { :value =>@persona.genero, :expires => 1.week.from_now }

            if(params[:redirect_to].nil?)
              redirect_to '/start'
            else
              redirect_to params[:redirect_to].to_s
            end

          else
            redirect_to "/login", :alert => "Usuario bloqueado."
          end
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

  
  def destroy
    session[:usuario_id] = nil
    session[:genero] = nil
    cookies[:usuario_id] = 0
    cookies[:genero] = nil
    redirect_to "/login"
  end
end
