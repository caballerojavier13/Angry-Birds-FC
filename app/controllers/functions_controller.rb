class FunctionsController < ApplicationController
  # GET /functions
  # GET /functions.json
  def index
    @functions = Functions.order('name ASC').paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @functions }
    end
  end

  # GET /functions/1
  # GET /functions/1.json
  def show
    @function = Functions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @function }
    end
  end

  # GET /functions/new
  # GET /functions/new.json
  def new
    @function = Functions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @function }
    end
  end

  # GET /functions/1/edit
  def edit
    @function = Functions.find(params[:id])
  end

  # POST /functions
  # POST /functions.json
  def create
    @function = Functions.new()
    @function.name = params[:name]
    @function.save
    respond_to do |format|
      format.js
    end
  end

  # PUT /functions/1
  # PUT /functions/1.json
  def update
    @function = Functions.find(params[:id])
    @function.update_attributes(:name => params[:name])
    respond_to do |format|
      format.js
    end
  end

  # DELETE /functions/1
  # DELETE /functions/1.json
  def destroy
    @function = Functions.find(params[:id])
    @function.destroy

    respond_to do |format|
      format.js
    end
  end
end
