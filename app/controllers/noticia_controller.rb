#coding: utf-8
class NoticiaController < SecurityController
  # GET /noticia
  # GET /noticia.json
  def index
    @noticia = Noticium.order('id DESC').paginate(:page => params[:page], :per_page => 8)

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @noticia }
    end
  end
  def mis_noticias
    @noticia = Noticium.where(persona_id: session[:usuario_id]).order('id DESC').paginate(:page => params[:page], :per_page => 8)

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @noticia }
    end
  end
  # GET /noticia/1
  # GET /noticia/1.json
  def show
    @noticium = Noticium.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @noticium }
    end
  end

  # GET /noticia/new
  # GET /noticia/new.json
  def new
    @persona = Persona.find(session[:usuario_id])
    @noticium = Noticium.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @noticium }
    end
  end

  # GET /noticia/1/edit
  def edit
    @noticium = Noticium.find(params[:id])
    params[:titulo] = @noticium.titulo
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
  end
end
