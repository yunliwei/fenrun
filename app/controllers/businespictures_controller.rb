class BusinespicturesController < ApplicationController

  def create
    @busine = Busine.find(params[:busine_id])
    @businespicture = @busine.businespictures.create(businespicture_params)
    redirect_to edit_busine_path(@busine)
  end
  def destroy
    @busine = Busine.find(params[:busine_id])
    @businespicture = @busine.businespictures.find(params[:id])
    @businespicture.destroy
    redirect_to edit_busine_path(@busine)
  end
  private
  def businespicture_params
    params.require(:businespicture).permit(:busine_id, :picture)
  end
end
