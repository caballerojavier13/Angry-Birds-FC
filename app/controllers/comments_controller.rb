#coding: utf-8
class CommentsController < SecurityController
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end


  # POST /comments
  # POST /comments.json
  
  def create
    url = "/noticias/" + params[:noticia].to_s  
    if params[:text_area_comment].size > 0    
      @comment = Comment.new
      usuario_id = params[:usuario]
      @comment.persona_id = usuario_id
      @comment.noticia_id = params[:noticia]
      @comment.cuerpo = params[:text_area_comment]
      noticia = Noticium.find params[:noticia]
      comentarista = Persona.find(usuario_id)
        
      if @comment.save
        #Crear Notificaciones
        @personas = Persona.activo.where(['personas.id <> ?', params[:usuario]]).joins(:comments).where(comments: {noticia_id: params[:noticia]})
        
          @personas.uniq.each do |p|
    	        @notifications = Notification.where("noticia_id = ? AND read = ? AND persona_id = ?",params[:noticia], false, p.id)
      	      unless @notifications.nil?
    	          @notifications.at(0).actualizar_notificacion comentarista.nombre + " " + comentarista.apellido unless @notifications.at(0).nil?
      	      else
    	          notificacion = Notification.new
         	      notificacion.read = false
          	    notificacion.noticia_id = noticia.id
          	    notificacion.mensaje = noticia.titulo
          	    notificacion.persona_id = p.id
          	    notificacion.usuarios = comentarista.nombre + " " + comentarista.apellido
                notificacion.save
    	        end
          end
        
        unless @personas.include?(noticia.persona)
        	if noticia.persona.id != comentarista.id
                @notification = Notification.where("noticia_id = ? AND read = ? AND persona_id = ?",params[:noticia], false, params[:usuario])
                unless @notifications.nil?
                  @notifications.at(0).actualizar_notificacion comentarista.nombre + " " + comentarista.apellido unless @notifications.at(0).nil?
                else
                  notificacion = Notification.new
                  notificacion.read = false
                  notificacion.noticia_id = noticia.id
                  notificacion.mensaje = noticia.titulo
                  notificacion.persona_id = noticia.persona.id
                  notificacion.usuarios = comentarista.nombre + " " + comentarista.apellido
                  notificacion.save
                end
        	end
        end
      #fin crear notificaciones
  
        
      end
    end
  if request.xhr?
    respond_to do |format|
      format.js   
    end 
  else
    respond_to do |format|
      format.html { redirect_to url }
      format.json { head :no_content }
    end
  end
  end
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    url = "/noticias/" + params[:noticia].to_s
    if request.xhr?
        respond_to do |format|
          format.js  
        end 
      else
        respond_to do |format|
          format.html { redirect_to url }
          format.json { head :no_content }
        end
      end
  end
  end
