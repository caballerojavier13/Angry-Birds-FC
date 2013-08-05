class CommentsController < ApplicationController
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
    @comment = Comment.new
    usuario_id = params[:usuario]
    @comment.usuario_id = usuario_id
    @comment.noticia_id = params[:noticia]
    
    @comment.cuerpo = params[:text_area_comment]
    url = "/noticias/" + params[:noticia].to_s
	
    
    if @comment.save
      if request.xhr?
        respond_to do |format|
          format.js   { render :comentario => @comment }
        end 
      else
        respond_to do |format|
          format.html { redirect_to url }
          format.json { head :no_content }
        end
      end
    end
  end
  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    url = "/noticias/" + params[:noticia].to_s
    respond_to do |format|
      format.html { redirect_to url }
      format.json { head :no_content }
	    format.js   { render :nothing => true }
    end
  end
end
