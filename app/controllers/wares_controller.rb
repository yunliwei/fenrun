class WaresController < ApplicationController
  before_action :set_ware, only: [:show, :edit, :update, :destroy]
def index
  @wares = Ware.all
end
def new
  @ware = Ware.new
end
def show
end

def create
  @ware = Ware.new(ware_params)

  respond_to do |format|
    if @ware.save
      format.html { redirect_to @ware, notice: 'Test was successfully created.' }
      format.json { render :show, status: :created, location: @ware }
    else
      format.html { render :new }
      format.json { render json: @ware.errors, status: :unprocessable_entity }
    end
  end
end

  def update
    respond_to do |format|
      if @ware.update(ware_params)
        format.html { redirect_to @ware, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @ware }
      else
        format.html { render :edit }
        format.json { render json: @ware.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ware.destroy
    respond_to do |format|
      format.html { redirect_to wares_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
# Use callbacks to share common setup or constraints between actions.
def set_ware
  @ware = Ware.find(params[:id])
end

def ware_params
  params.require(:ware).permit(:ware, :price,:discountprice,:salevolume,:describe,:stock,:freight,:discount,:baseprice)
end
end
