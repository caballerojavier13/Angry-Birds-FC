#coding: utf-8
class CalificacionsController < SecurityController

  # GET /calificacions
  # GET /calificacions.json
  def index
    @calificacions = Calificacion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @calificacions }
    end
  end

  # GET /calificacions/1
  # GET /calificacions/1.json
  def show
    @calificacion = Calificacion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @calificacion }
    end
  end

  # GET /calificacions/new
  # GET /calificacions/new.json
  def new
    @calificacion = Calificacion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @calificacion }
    end
  end

  # GET /calificacions/1/edit
  def edit
    @calificacion = Calificacion.find(params[:id])
  end

  # POST /calificacions
  # POST /calificacions.json
  def create
    @calificacion = Calificacion.new
    @calificacion.persona_id = session[:usuario_id]
    @calificacion.noticia_id = params[:noticia]
    @calificacion.valor = params[:valor]
    @calificacion.save
    calificaciones = Calificacion.where("noticia_id = ?",params[:noticia])
    @total = 0
    @promedio = 0
    calificaciones.each do|c|
      @total += c.valor
    end
    @promedio = Float( Float(@total) / Float(calificaciones.size)).round(2)
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

  # PUT /calificacions/1
  # PUT /calificacions/1.json
  def update
    @calificacion = Calificacion.find(params[:id])

    respond_to do |format|
      if @calificacion.update_attributes(params[:calificacion])
        format.html { redirect_to @calificacion, notice: 'Calificacion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @calificacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calificacions/1
  # DELETE /calificacions/1.json
  def destroy
    @calificacion = Calificacion.find(params[:id])
    @calificacion.destroy

    respond_to do |format|
      format.html { redirect_to calificacions_url }
      format.json { head :no_content }
    end
  end
end
