class WarepicturesController < ApplicationController
  def create
    @ware = Ware.find(params[:ware_id])
    @warepicture = @ware.warepictures.create(warepicture_params)
    redirect_to edit_ware_path(@ware)
  end
  def destroy
    @ware = Ware.find(params[:ware_id])
    @warepicture = @ware.warepictures.find(params[:id])
    @warepicture.destroy
    redirect_to edit_ware_path(@ware)
  end
  private
  def warepicture_params
    params.require(:warepicture).permit(:wareid,:ware_id, :picture)
  end
end
