#coding: utf-8
class VideosController < SecurityController
  # GET /videos
  # GET /videos.json
  def index
    @notificaciones = Notification.where("`read` = ? AND persona_id = ?", false, session[:usuario_id])
    
    if params[:search].nil?
      @videos = Video.order('id DESC').paginate(:page => params[:page], :per_page => 5)
    else
      if params[:search].to_s.size > 0
        @videos = Video.search(params[:search]).order('id DESC').paginate(:page => params[:page], :per_page => 5)
      else
        @videos = Video.order('id DESC').paginate(:page => params[:page], :per_page => 5)
      end  
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @videos }
    end
  end

  def mis_videos
    @notificaciones = Notification.where("`read` = ? AND persona_id = ?", false, session[:usuario_id])
    if params[:search].nil?
      @videos = Video.where(persona_id: session[:usuario_id]).order('id DESC').paginate(:page => params[:page], :per_page => 5)
    else
      if params[:search].to_s.size > 0
        @videos = Video.where(persona_id: session[:usuario_id]).search(params[:search]).order('id DESC').paginate(:page => params[:page], :per_page => 5)
      else
        @videos = Video.where(persona_id: session[:usuario_id]).order('id DESC').paginate(:page => params[:page], :per_page => 5)
      end  
    end
  end
  # GET /videos/1
  # GET /videos/1.json
  def show
    @video = Video.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @video }
    end
  end
  
  # GET /videos/new
  # GET /videos/new.json
  def new
    @notificaciones = Notification.where("`read` = ? AND persona_id = ?", false, session[:usuario_id])
    @persona = Persona.find(session[:usuario_id])
    @video = Video.new
    @video.persona = @persona
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @video }
    end
  end

  # GET /videos/1/edit
  def edit
    @notificaciones = Notification.where("`read` = ? AND persona_id = ?", false, session[:usuario_id])
    @video = Video.find(params[:id])
    unless @video.persona.id == session[:usuario_id]
      redirect_to "/videos", :alert => "Solo el dueño del video puede editarlo."
    end
  end

  # POST /videos
  # POST /videos.json
  def create
    
    @video = Video.new(params[:video])
    @video.persona= Persona.find(session[:usuario_id])
    respond_to do |format|
      if @video.save
        format.html {redirect_to "/videos", :alert => "Video subido correctamente."}
      else
        format.html { render action: "new" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /videos/1
  # PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    respond_to do |format|
      if @video.update_attributes(params[:video])
        format.html {redirect_to "/mis_videos", :alert => "Video modificado correctamente."}
      else
        format.html { render action: "edit" }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video = Video.find(params[:id])
    if @video.persona.id == session[:usuario_id]
      @video.destroy

      respond_to do |format|
        format.html { redirect_to "/mis_videos", :alert => "video eliminado." }
        format.json { head :no_content }
      end
    else
      redirect_to "/videos", :alert => "Solo el dueño del video puede eliminarlo."
    end
  end
end
