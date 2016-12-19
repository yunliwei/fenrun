class WaresController < ApplicationController
  before_action :set_ware, only: [:show, :edit,  :destroy]
def index
  @wares = Ware.all

  #cal =Ware.create(ware:'123')
  #Classification.create(classname:'111')
 # cccc=Classification.find(1)
 # cal.classifications.push(cccc)



end


def new
  @ware = Ware.new
  @class=Classification.all
end


def show
end

  def edit
    @class=Classification.all
    @ware = Ware.find(params[:id])
    params[:ware]=@ware.ware
    params[:price]=@ware.price
    params[:discountprice]=@ware.discountprice
    params[:salevolume]=@ware.salevolume
    params[:describe]=@ware.describe
    params[:stock]=@ware.stock
    params[:freight]=@ware.freight
    params[:discount]=@ware.discount
    params[:baseprice]=@ware.baseprice
    #debugger

 end




def create

  @ware = Ware.new(ware:params[:ware],price:params[:price],discountprice:params[:discountprice],salevolume:params[:salevolume],describe:params[:describe], stock:params[:stock],freight:params[:freight],discount:params[:discount],baseprice:params[:baseprice],warepicture:params[:warepicture])


  id=params[:classifi]
  arr = Array.new(id.split(','))

  #debugger
  cccc=Classification.find(arr)
  @ware.classifications.push(cccc)
  #@ware = Ware.new(ware_params)
  # respond_to do |format|
  #   if @ware.save
  #
  #    format.html { redirect_to @ware, notice: 'Test was successfully created.' }
  #     format.json { render :show, status: :created, location: @ware }
  #   else
  #     format.html { render :new }
  #     format.json { render json: @ware.errors, status: :unprocessable_entity }
  #   end
  # end
end

  def update
    @ware = Ware.find(params[:id])
    @ware.update(ware:params[:ware],price:params[:price],discountprice:params[:discountprice],salevolume:params[:salevolume], describe:params[:describe], stock:params[:stock],freight:params[:freight],discount:params[:discount],baseprice:params[:baseprice],warepicture:params[:warepicture])
    redirect_to wares_url
    #
     # respond_to do |format|
     #   if @ware.update(ware_params)
     #
     #     format.html { redirect_to @ware, notice: 'Test was successfully updated.' }
     #     format.json { render :show, status: :ok, location: @ware }
     #   else
     #     format.html { render :edit }
     #     format.json { render json: @ware.errors, status: :unprocessable_entity }
     #   end
     # end
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
  params.require(:ware).permit(:ware, :price,:discountprice,:salevolume,:describe,:stock,:freight,:discount,:baseprice,:warepicture)
end


end
