class WaresController < ApplicationController
  before_action :set_ware, only: [ :edit,:update,  :destroy]
def index
  @wares = Ware.all

end


def new

  @ware=Ware.create(ware:params[:ware],price:params[:price],discountprice:params[:discountprice],salevolume:params[:salevolume],describe:params[:describe], stock:params[:stock],freight:params[:freight],discount:params[:discount],baseprice:params[:baseprice],warepicture:params[:warepicture],isnew:0)
  #@class=Classification.all
  redirect_to edit_ware_path(@ware)


  #render :edit
end


def show
end

  def edit
    @class=Classification.all
    #debugger
    @ware = Ware.find(params[:id])
    @cla=@ware.classifications
    @claid=''
    @cla.each do |i|
      @claid=@claid+i.id.to_s+','
      #debugger
    end
    @claid= @claid[0..@claid.length-2]
    params[:claid]=@claid
    #debugger

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

  def createtype
#id=params[:wareid]
#debugger
    @waretype=Waretype.new(ware_id:params[:wareid],typename:params[:typename])
    @waretype.save
    #debugger
    redirect_to(:action => "new" )

  end


def create

  @ware = Ware.new(ware:params[:ware],price:params[:price],discountprice:params[:discountprice],salevolume:params[:salevolume],describe:params[:describe], stock:params[:stock],freight:params[:freight],discount:params[:discount],baseprice:params[:baseprice],warepicture:params[:warepicture],isnew:1)

  id=params[:classifi]
  arr = Array.new(id.split(','))

  #debugger
  cccc=Classification.find(arr)
  @ware.classifications.push(cccc)
  @ware.save
  redirect_to(:action => "index" )
  #@ware = Ware.new(ware_params)
  # respond_to do |format|
  @ware.save
  #
  #    format.html { redirect_to @ware, notice: 'Test was successfully created.' }
  #     format.json { render :index, status: :created, location: @ware }
  #   else
  #     format.html { render :new }
  #     format.json { render json: @ware.errors, status: :unprocessable_entity }
  #   end
  # end
end




  def update
    @ware = Ware.find(params[:id])
    @ware.update(ware:params[:ware],price:params[:price],discountprice:params[:discountprice],salevolume:params[:salevolume], describe:params[:describe], stock:params[:stock],freight:params[:freight],discount:params[:discount],baseprice:params[:baseprice],warepicture:params[:warepicture],isnew:1)

    id=params[:classifi]
    arr = Array.new(id.split(','))

    #debugger
    cccc=Classification.find(arr)
    @ware.classifications.replace(cccc)
    redirect_to(:action => "index" )
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
