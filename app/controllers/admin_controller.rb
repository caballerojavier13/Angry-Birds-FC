class AdminController < SecurityController

  def index
    @persona = Persona.find(session[:usuario_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user }
    end
  end
  def create
    session[:usuario_id] = nil
    redirect_to "/start"
  end

  def logout
    session[:usuario_id] = nil
    redirect_to "/login", :notice => "Logged out"
  end
end
