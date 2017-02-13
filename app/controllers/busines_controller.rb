class BusinesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  def index
    @busines = Busine.all
  end
  def new
    # @busines = Busine.new
    # @class=Classification.all


    @busines=Busine.create()
    #@class=Classification.all
    redirect_to edit_busine_path(@busines)
  end

  def createcla
    @class=Ware.classifications.all
    @class.create()
  end

  def edit
    @class=Classification.all
    @busine= Busine.find(params[:id])
    @cla=@busines.classifications
    @claid=''
    @cla.each do |i|
      @claid=@claid+i.id.to_s+','
    end
    @claid= @claid[0..@claid.length-2]
    params[:claid]=@claid
    #debugger

    params[:name]=@busine.name
    params[:salessum]=@busine.salessum
    params[:phonenumber]=@busine.phonenumber
    params[:businelicense]=@busine.businelicense
    params[:businelogo]=@busine.businelogo
    params[:jianjie]=@busine.jianjie

  end

  def create
    @busines = Busine.new(name:params[:name],salessum:params[:salessum],phonenumber:params[:phonenumber],businelicense:params[:businelicense],businelogo:params[:businelogo],jianjie:params[:jianjie])
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
    @busines = Busine.find(params[:id])
    @busines .update(name:params[:name],salessum:params[:salessum],phonenumber:params[:phonenumber],businelicense:params[:businelicense],businelogo:params[:businelogo],jianjie:params[:jianjie])
    id=params[:busines]
    arr = Array.new(id.split(','))

    #debugger
    cccc=Classification.find(arr)
    @busines.classifications.replace(cccc)
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
    params.require(:busine).permit(:name, :salessum, :phonenumber, :businelicense ,:businelogo,:jianjie)
  end
end
