class BusinesController < ApplicationController
  def index
    @busines = Busine.all
  end
  def new
    @busines = Busine.new
  end
  def edit
  end
  def create
    @busines = Busine.new(business_params)
    respond_to do |format|
      if @busines.save
        format.html { redirect_to @busines, notice: 'Admin was successfully created.' }
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
        format.html { redirect_to @busines, notice: 'Test was successfully updated.' }
        format.json { render :index, status: :ok, location: @busines }
      else
        format.html { render :edit }
        format.json { render json: @busines.errors, status: :unprocessable_entity }
      end
    end
  end
  def set_business
    @busines = Busine.find(params[:id])
  end
# Never trust parameters from the scary internet, only allow the white list through.
  def business_params
    params.require(:busines).permit(:name, :region, :salessum, :phonenumber, :registertime )
  end
end
