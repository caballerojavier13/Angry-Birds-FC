#coding: utf-8
class PersonasController < MasterSecurityController
  before_filter :only_admin, only: [ :destroy]

  # GET /personas
  # GET /personas.json
  
  def index
    @personas = Persona.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @personas }
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
	session[:id]= @persona.id_to_s
        redirect_to "/thanks/?id=" + @persona.id.to_s
     else
       redirect_to "/login", :alert => 'No se encuentró ningún usuario.'
     end
  end


  def thanks
    @persona = Persona.find(params[:id])
    params[:id]= nil
  end
  
  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
	 
    @persona = Persona.find(params[:id])
    @persona.destroy

    respond_to do |format|
      format.html { redirect_to personas_url }
      format.json { head :no_content }
    end
  end
end
