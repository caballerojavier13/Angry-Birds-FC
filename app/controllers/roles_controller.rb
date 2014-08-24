class RolesController < ApplicationController
  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.order('name ASC').paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new()
    @role.name = params[:name]
    @role.save
    respond_to do |format|
      format.js
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = Role.find(params[:id])
    @role.update_attributes(:name => params[:name])
    respond_to do |format|
      format.js
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.js
    end
  end
end
