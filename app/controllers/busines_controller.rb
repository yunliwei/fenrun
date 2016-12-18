class BusinesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  def index
    @busines = Busine.all
  end
  def new
    @busines = Busine.new
    @class=Classification.all
  end

  def createcla
    @class=Ware.classifications.all
    @class.create()
  end

  def edit
    @class=Classification.all
  end

  def create
    @busines = Busine.new(name:params[:name],salessum:params[:salessum],phonenumber:params[:phonenumber],businelicense:params[:businelicense],businelogo:params[:businelogo])
    id=params[:busines]
    arr = Array.new(id.split(','))
    #debugger
    cccc=Classification.find(arr)
    @busines.classifications.push(cccc)

    respond_to do |format|
      if @busines.save
        format.html { redirect_to busines_path, notice: 'Admin was successfully created.' }
        format.json { render :index, status: :created, location: @busines }
      else
        format.html { render :new }
        format.json { render json: @busines.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @busines.update(business_params)
        format.html { redirect_to busines_path, notice: 'Test was successfully updated.' }
        format.json { render :index, status: :ok, location: @busines }
      else
        format.html { render :edit }
        format.json { render json: @busines.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @busines.destroy
    respond_to do |format|
      format.html { redirect_to busines_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def set_business
    @busines = Busine.find(params[:id])
  end
# Never trust parameters from the scary internet, only allow the white list through.
  def business_params
    params.require(:busine).permit(:name, :salessum, :phonenumber, :businelicense ,:businelogo)
  end
end
