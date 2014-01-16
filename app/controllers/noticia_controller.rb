#coding: utf-8
class NoticiaController < SecurityController
  # GET /noticia
  # GET /noticia.json
  def index
    if params[:search].nil?
      @noticia = Noticium.order('id DESC').paginate(:page => params[:page], :per_page => 8)
    else
      if params[:search].to_s.size > 0
        @noticia = Noticium.search(params[:search]).order('id DESC').paginate(:page => params[:page], :per_page => 8)
      else
        @noticia = Noticium.order('id DESC').paginate(:page => params[:page], :per_page => 8)
      end
      @noticia = Noticium.search(params[:search]).order('id DESC').paginate(:page => params[:page], :per_page => 8)  
    end
    @notificaciones = Notification.where("read = ? AND persona_id = ?", false, session[:usuario_id])
  end
  def mis_noticias
    @notificaciones = Notification.where("read = ? AND persona_id = ?", false, session[:usuario_id])
    if params[:search].nil?
      @noticia = Noticium.where(persona_id: session[:usuario_id]).order('id DESC').paginate(:page => params[:page], :per_page => 8)
    else
      if params[:search].to_s.size > 0
        @noticia = Noticium.where(persona_id: session[:usuario_id]).search(params[:search]).order('id DESC').paginate(:page => params[:page], :per_page => 8)
      else
        @noticia = Noticium.where(persona_id: session[:usuario_id]).order('id DESC').paginate(:page => params[:page], :per_page => 8)
      end
    end
    
    
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @noticia }
      end
  end
  # GET /noticia/1
  # GET /noticia/1.json
  def show
    @usuario_id = session[:usuario_id]
    @noticium = Noticium.find(params[:id])
    @comentarios = Comment.where(noticia_id: @noticium.id).order('id ASC')
    @notificaciones = Notification.where("read = ? AND persona_id = ? AND noticia_id = ?", false, session[:usuario_id],params[:id])
    @notificaciones.each do |n|
      n.mark_as_read
    end
    @total = 0
    @califico = true
    @notificaciones = Notification.where("read = ? AND persona_id = ?", false, session[:usuario_id])

    if @noticium.persona_id != @usuario_id
      @califico = (Calificacion.where("noticia_id = ? AND persona_id = ?",params[:id], session[:usuario_id]).size > 0)
    end
    calificaciones = Calificacion.where("noticia_id = ?",params[:id])
    @promedio = 0
    calificaciones.each do|c|
      @total += c.valor
    end
    if @total > 0
      @promedio = Float( Float(@total) / Float(calificaciones.size)).round(2)
    end
  end

  # GET /noticia/new
  # GET /noticia/new.json
  def new
    @notificaciones = Notification.where("read = ? AND persona_id = ?", false, session[:usuario_id])
    @persona = Persona.find(session[:usuario_id])
    @noticium = Noticium.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @noticium }
    end
  end

  # GET /noticia/1/edit
  def edit
    @notificaciones = Notification.where("read = ? AND persona_id = ?", false, session[:usuario_id])
    @noticium = Noticium.find(params[:id])
    @persona = Persona.find(session[:usuario_id])
    if @persona.admin || @noticium.persona.id == @persona.id
      params[:titulo] = @noticium.titulo
    else
      redirect_to "/noticias", :alert => 'Solo el dueño de la noticia puede editarla.'
    end
    
  end

  # POST /noticia
  # POST /noticia.json
  def create
    @persona = Persona.find(session[:usuario_id])
    @noticium = Noticium.new()
    @noticium.titulo = params[:titulo]
    @noticium.cuerpo = params[:cuerpo]
    @noticium.persona=  @persona
    unless params[:picture].nil?
      @imagen = Imagen.new()
      @imagen.persona=@persona
      flickr_id = Flickrphoto.new.subir_imagen params[:picture] 
       if flickr_id.nil?
         @noticium.imagen = nil 
       else
         @imagen.url = Flickrphoto.new.get_url_flickr flickr_id
         @imagen.picasa_id = flickr_id
         @imagen.save
         @noticium.imagen = @imagen
       end
    end
    respond_to do |format|
      if @noticium.save
        format.html { redirect_to @noticium, :alert => 'Noticia creada correctamente.' }
        format.json { render json: @noticium, status: :created, location: @noticium }
      else
        @imagen.destroy unless @imagen.nil?
        format.html { render action: "new" }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /noticia/1
  # PUT /noticia/1.json
  def update
    @noticium = Noticium.find(params[:id])
    unless params[:picture].nil?
      @persona = Persona.find(session[:usuario_id])
      @imagen = Imagen.new()
      @imagen.persona=@persona
      flickr_id = Flickrphoto.new.subir_imagen params[:picture] 
       if flickr_id.nil?
         @noticium.imagen = nil 
       else
         @imagen.url = Flickrphoto.new.get_url_flickr flickr_id
         @imagen.picasa_id = flickr_id
         @imagen.save
         @noticium.imagen = @imagen
       end
    end
    respond_to do |format|
      if @noticium.update_attributes(params[:noticium])
        format.html { redirect_to @noticium, :alert =>'Los cambios han sido guardados.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @noticium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /noticia/1
  # DELETE /noticia/1.json
  def destroy
    @noticium = Noticium.find(params[:id])
    @persona = Persona.find(session[:usuario_id])
    if @persona.admin || @noticium.persona_id.to_s == session[:usuario_id].to_s
      imagen = @noticium.imagen
      unless imagen.nil?
        @noticium.imagen = nil
        imagen.destroy
      end
      @noticium.destroy
      respond_to do |format|
        format.html { redirect_to "/mis_noticias", :alert =>'La noticia fue correctamente eliminada.' }
        format.json { head :no_content }
      end
    else
      redirect_to "/noticias", :alert => 'Solo el dueño de la noticia puede eliminarla.'
    end
  end

  def comentar
    @comment = Comment.new
    usuario_id = params[:usuario]
    @comment.usuario_id = usuario_id
    @comment.noticia_id = params[:noticia]
    
    @comment.cuerpo = params[:text_area_comment]
    @comment.save
      respond_to do |format|
	    format.js
      end

  end 
end
