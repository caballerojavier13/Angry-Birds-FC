#coding: utf-8
class PersonasController < ApplicationController

  before_filter :authorize, :only => [:destroy]
  def authorize
    unless session[:usuario_id].nil?
      unless Persona.find_by_id(session[:usuario_id]).admin
        redirect_to '/'
      end
    else
      redirect_to '/login'
    end
  end

  # GET /personas/new
  # GET /personas/new.json
  def new
    @persona = Persona.new
    @year_fin = Date.today.year
    @year_inicio = @year_fin - 100
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @persona }
    end
  end

  # POST /personas
  # POST /personas.json
  def create
    @persona = Persona.new(params[:persona])
    
    @persona.codigo= Persona.generate_activation_code
    @persona.activo=false
    @persona.bloqueado=false
    @persona.admin=false
    @persona.role = Role.find_by_name 'Usuario Comun'


    
    respond_to do |format|
      if @persona.save
	      UserMailer.registration_confirmation(@persona).deliver
        format.html { redirect_to "/thanks/?id=" + @persona.id.to_s , notice: 'Persona was successfully created.' }
        format.json { render json: @persona, status: :created, location: @persona }
      else
        format.html { render action: "new" }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end



  def activate
    @persona = Persona.unscoped.find(params[:id])
  	if @persona != nil
  		if @persona.codigo == params[:codigo]
  			@persona.activate! 
  			session[:usuario_id] = @persona.id
        @novelties = Novelty.all

        @novelties.each do|n|
          usr_novelty = UsrNovelty.new
          usr_novelty.persona = @persona
          usr_novelty.novelty = n
          usr_novelty.viewed = false
          usr_novelty.save
        end
  			redirect_to "/start"
  		else
  			redirect_to "/error_activation"
  		end
  
  	else
  		redirect_to "/error_activation"
  	end

  end

  def change_password
    mail_username = session[:mail]
    persona_mail = Persona.where(email: mail_username).first 
    persona_username = Persona.where(username: mail_username).first
    if persona_mail.nil?
      @persona = persona_username
    else
      @persona = persona_mail
    end         
    unless @persona.nil?
     	@persona.update_attribute(:codigo, Persona.generate_activation_code)
     	session[:mail] = nil
	    UserMailer.forgot_password(@persona).deliver
	    session[:id]= @persona.id.to_s
      redirect_to "/thanks/?id=" + @persona.id.to_s
    else
      redirect_to "/login", :alert => 'No se encuentró ningún usuario.'
    end
  end


  def thanks
    @persona = Persona.find(params[:id])
    params[:id]= nil
  end

  #PUT /persona/1

  def update
    @persona = Persona.find(params[:id])
    respond_to do |format|
      if @persona.update_attributes(params[:persona])
        format.html { redirect_to "/" }
        format.json { head :no_content }
      else
        format.html { redirect_to "/" }
        format.json { head :no_content }
      end
    end
  end




  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    @administrador = Persona.find(session[:usuario_id])
    if @administrador.admin
      @persona = Persona.find(params[:id])

      @noticias = Noticium.find_all_by_persona_id(params[:id])
      @videos = Video.find_all_by_persona_id(params[:id])
      @imagenes = Imagen.find_all_by_persona_id(params[:id])
      @comentarios = Comment.find_all_by_persona_id(params[:id])
      @notificaciones = Notification.find_all_by_persona_id(params[:id])

      unless @noticias.nil?
        @noticias.each do |n|
          n.destroy
        end
      end

      unless @videos.nil?
          @videos.each do |v|
            v.destroy
          end
      end

      unless @imagenes.nil?
          @imagenes.each do |i|
            i.destroy
          end
      end

      unless @comentarios.nil?
          @comentarios.each do |c|
            c.destroy
          end
      end

      unless @notificaciones.nil?
          @notificaciones.each do |n|
            n.destroy
          end
      end


      @persona.destroy

      respond_to do |format|
        format.json { head :no_content }
      end
    end

  end

  def show
    @usuario = Persona.find(params[:id])
    if session[:usuario_id].to_s != @usuario.id.to_s
        redirect_to '/'
    end
    @year_fin = Date.today.year
    @year_inicio = @year_fin - 100
  end


  def change_atributo
    @persona = Persona.find params[:id]
    if session[:usuario_id].to_s != @persona.id.to_s
      redirect_to '/'
    end
    if params[:atributo] == 'genero'

      if params[:valor] == 'true'
        @persona.change_data_account(params[:atributo],true)
        session[:genero] = true
        cookies[:genero] = { :value =>true, :expires => 1.week.from_now }
      else
        @persona.change_data_account(params[:atributo],false)
        session[:genero] = false
        cookies[:genero] = { :value =>false, :expires => 1.week.from_now }
      end
    else
      @persona.change_data_account(params[:atributo],params[:valor])
    end

  end

  def change_username
    @persona = Persona.find params[:id]
    if session[:usuario_id].to_s == @persona.id.to_s
      unless @persona.username == params[:valor]
        if params[:valor].size > 3
          if Persona.find_all_by_username(params[:valor]).at(0).nil?
            @persona.change_data_account('username',params[:valor])
            UserMailer.change_username(@persona).deliver
            @error = false
          else
            @mensaje = 'El usuario ya existe'
            @error = true
          end
        else
          @error = true
          @mensaje = 'El usuario tiene un formato incorrecto'
        end

      end
    end

  end

end