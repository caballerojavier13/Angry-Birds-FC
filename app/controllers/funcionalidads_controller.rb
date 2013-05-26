class FuncionalidadsController < SecurityController
  # GET /funcionalidads
  # GET /funcionalidads.json
  def index
    @funcionalidads = Funcionalidad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @funcionalidads }
    end
  end

  # GET /funcionalidads/1
  # GET /funcionalidads/1.json
  def show
    @funcionalidad = Funcionalidad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @funcionalidad }
    end
  end

  # GET /funcionalidads/new
  # GET /funcionalidads/new.json
  def new
    @funcionalidad = Funcionalidad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @funcionalidad }
    end
  end

  # GET /funcionalidads/1/edit
  def edit
    @funcionalidad = Funcionalidad.find(params[:id])
  end

  # POST /funcionalidads
  # POST /funcionalidads.json
  def create
    @funcionalidad = Funcionalidad.new(params[:funcionalidad])

    respond_to do |format|
      if @funcionalidad.save
        format.html { redirect_to @funcionalidad, notice: 'Funcionalidad was successfully created.' }
        format.json { render json: @funcionalidad, status: :created, location: @funcionalidad }
      else
        format.html { render action: "new" }
        format.json { render json: @funcionalidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /funcionalidads/1
  # PUT /funcionalidads/1.json
  def update
    @funcionalidad = Funcionalidad.find(params[:id])

    respond_to do |format|
      if @funcionalidad.update_attributes(params[:funcionalidad])
        format.html { redirect_to @funcionalidad, notice: 'Funcionalidad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @funcionalidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionalidads/1
  # DELETE /funcionalidads/1.json
  def destroy
    @funcionalidad = Funcionalidad.find(params[:id])
    @funcionalidad.destroy

    respond_to do |format|
      format.html { redirect_to funcionalidads_url }
      format.json { head :no_content }
    end
  end
end
