class MallsController < ApplicationController
  before_action :set_mall, only: [:show, :edit, :update, :destroy]
  def index

    @malls = Mall.all

  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show

  end

  # GET /subjects/new
  def new
    @mall = Mall.new
  end

  # GET /subjects/1/edit
  def edit


  end

  # POST /subjects
  # POST /subjects.json
  def create
    @mall = Mall.new(mall_params)
    respond_to do |format|
      if @mall.save
        format.html { redirect_to malls_path, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @mall }
      else
        format.html { render :new }
        format.json { render json: @mall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @mall.update(mall_params)
        format.html { redirect_to malls_path, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @mall }
      else
        format.html { render :edit }
        format.json { render json: @mall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @mall.destroy
    respond_to do |format|
      format.html { redirect_to malls_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_mall
    @mall = Mall.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def mall_params
    params.require(:mall).permit(:mallname, :malllogo, :descripte, :telephone, :storerecruit,:customerservice)
  end
end
