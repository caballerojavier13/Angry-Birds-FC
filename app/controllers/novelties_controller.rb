#coding: utf-8
class NoveltiesController < MasterSecurityController
  # GET /novelties
  # GET /novelties.json
  def index
    @novelties = Novelty.order('id DESC').paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @novelties }
    end
  end

  # GET /novelties/1
  # GET /novelties/1.json
  def show
    @novelty = Novelty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @novelty }
    end
  end

  # GET /novelties/new
  # GET /novelties/new.json
  def new
    @novelty = Novelty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @novelty }
    end
  end

  # GET /novelties/1/edit
  def edit
    @novelty = Novelty.find(params[:id])
  end

  # POST /novelties
  # POST /novelties.json
  def create
    @novelty = Novelty.new()
    @novelty.message = params[:message]
    @novelty.save

    @personas = Persona.all

    @personas.each do|p|
      usr_novelty = UsrNovelty.new
      usr_novelty.persona = p
      usr_novelty.novelty = @novelty
      usr_novelty.viewed = false
      usr_novelty.save
    end
    respond_to do |format|

        format.js

    end
  end

  # PUT /novelties/1
  # PUT /novelties/1.json
  def update
    @novelty = Novelty.find(params[:id])
    @novelty.update_attributes(:message => params[:message])

    respond_to do |format|

      format.js

    end
  end

  # DELETE /novelties/1
  # DELETE /novelties/1.json
  def destroy
    @novelty = Novelty.find(params[:id])
    @novelty.destroy

    @usr_novelties = UsrNovelty.find_all_by_novelty_id(params[:id])

    @usr_novelties.each do|n|
      n.destroy
    end


    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to '/admin/novedades' }
        format.json { head :no_content }
      end
    end
  end
end
