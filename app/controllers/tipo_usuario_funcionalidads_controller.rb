#coding: utf-8
class TipoUsuarioFuncionalidadsController < SecurityController
  # GET /tipo_usuario_funcionalidads
  # GET /tipo_usuario_funcionalidads.json
  def index
    @tipo_usuario_funcionalidads = TipoUsuarioFuncionalidad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_usuario_funcionalidads }
    end
  end

  # GET /tipo_usuario_funcionalidads/1
  # GET /tipo_usuario_funcionalidads/1.json
  def show
    @tipo_usuario_funcionalidad = TipoUsuarioFuncionalidad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_usuario_funcionalidad }
    end
  end

  # GET /tipo_usuario_funcionalidads/new
  # GET /tipo_usuario_funcionalidads/new.json
  def new
    @tipo_usuario_funcionalidad = TipoUsuarioFuncionalidad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_usuario_funcionalidad }
    end
  end

  # GET /tipo_usuario_funcionalidads/1/edit
  def edit
    @tipo_usuario_funcionalidad = TipoUsuarioFuncionalidad.find(params[:id])
  end

  # POST /tipo_usuario_funcionalidads
  # POST /tipo_usuario_funcionalidads.json
  def create
    @tipo_usuario_funcionalidad = TipoUsuarioFuncionalidad.new(params[:tipo_usuario_funcionalidad])

    respond_to do |format|
      if @tipo_usuario_funcionalidad.save
        format.html { redirect_to @tipo_usuario_funcionalidad, notice: 'Tipo usuario funcionalidad was successfully created.' }
        format.json { render json: @tipo_usuario_funcionalidad, status: :created, location: @tipo_usuario_funcionalidad }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_usuario_funcionalidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_usuario_funcionalidads/1
  # PUT /tipo_usuario_funcionalidads/1.json
  def update
    @tipo_usuario_funcionalidad = TipoUsuarioFuncionalidad.find(params[:id])

    respond_to do |format|
      if @tipo_usuario_funcionalidad.update_attributes(params[:tipo_usuario_funcionalidad])
        format.html { redirect_to @tipo_usuario_funcionalidad, notice: 'Tipo usuario funcionalidad was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_usuario_funcionalidad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_usuario_funcionalidads/1
  # DELETE /tipo_usuario_funcionalidads/1.json
  def destroy
    @tipo_usuario_funcionalidad = TipoUsuarioFuncionalidad.find(params[:id])
    @tipo_usuario_funcionalidad.destroy

    respond_to do |format|
      format.html { redirect_to tipo_usuario_funcionalidads_url }
      format.json { head :no_content }
    end
  end
end
