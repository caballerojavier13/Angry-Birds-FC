#coding: utf-8
class ImagensController < SecurityController
  # GET /imagens
  # GET /imagens.json
  def index
    @imagens = Imagen.order('id DESC').paginate(:page => params[:page], :per_page => 21)
    params[:picture]=nil
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @imagens }
    end
  end
  def mis_imagenes
    @imagens = Imagen.where(persona_id: session[:usuario_id]).order('id DESC').paginate(:page => params[:page], :per_page => 21)
    params[:picture]=nil
  end

  # GET /imagens/new
  # GET /imagens/new.json
  def new
    @imagen = Imagen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @imagen }
    end
  end

  # POST /imagens
  # POST /imagens.json
  def create
    @imagen = Imagen.new()
    @imagen.persona_id = session[:usuario_id]
    if params[:picture].nil?
	    redirect_to "/imagenes", alert: "seleccione una imagen antes de guardar."  
   else
     flickr_id = Flickrphoto.new.subir_imagen params[:picture] 
     if flickr_id.nil?
	    redirect_to "/imagenes", alert: "Error al guardar"  
     else  
	     @imagen.url = Flickrphoto.new.get_url_flickr flickr_id
	     @imagen.picasa_id = flickr_id
	      respond_to do |format|
      		if @imagen.save
      		  format.html { redirect_to "/imagenes", alert: 'La imagen fue correctamente guardada.' }
      		  format.json { render json: @imagen, status: :created, location: @imagen }
      		else
      		  format.html {redirect_to "/imagenes", alert: 'Error en el guardado.'  }
      		  format.json { render json: @imagen.errors, status: :unprocessable_entity }
      		end
	      end
	    end
   end
  end
  # DELETE /imagens/1
  # DELETE /imagens/1.json  
  def destroy
    @imagen = Imagen.find(params[:id])
    if @imagen.persona.id = session[:usuario_id]
      @imagen.destroy
      redirect_to "/mis_imagenes", :alert =>"Imagen correctamente eliminada"
    else
      redirect_to "/videos", :alert =>"Acceso denegado."
    end
  end
end
