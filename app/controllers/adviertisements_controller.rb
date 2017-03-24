class AdviertisementsController < ApplicationController
  def index
@adviertisement=Adviertisement.all
  end

  def create
   # @adviertisement = Busine.find(params[:busine_id])
    @adviertisement = Adviertisement.create(adviertisement_params)
    redirect_to adviertisements_path
  end
  def destroy
    # @busine = Busine.find(params[:busine_id])
    @adviertisement =Adviertisement.find(params[:id])
    @adviertisement.destroy
    redirect_to adviertisements_path
  end
  def change
    debugger
    @adviertisement =Adviertisement.find(params[:id])
    @adviertisement.update(status:1)
    @adviertisement.save
    redirect_to adviertisements_path
  end
  private
  def adviertisement_params
    params.require(:adviertisement).permit(:status, :link,:image)
  end

end
