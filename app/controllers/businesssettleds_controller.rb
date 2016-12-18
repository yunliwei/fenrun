class BusinesssettledsController < ApplicationController
  before_action :set_businesssettled, only: [:show, :edit, :update, :destroy]
  def index

    @businesssettleds = Businesssettled.all.order("updated_at DESC").paginate(page:params[:page],per_page:3)
    @businesssettledcount=@businesssettleds.count
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show

  end

  # GET /subjects/new
  def new
    @businesssettled = Businesssettled.new
  end

  # GET /subjects/1/edit
  def edit

    @businesssettled = Businesssettled.find(params[:id])

  end

  # POST /subjects
  # POST /subjects.json
  def create
    @businesssettled = Businesssettled.new(businesssettled_params)
    respond_to do |format|
      if @businesssettled.save
        format.html { redirect_to businesssettleds_path, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @businesssettled }
      else
        format.html { render :new }
        format.json { render json: @businesssettled.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @businesssettled.update(businesssettled_params)
        format.html { redirect_to businesssettleds_path, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @businesssettled }
      else
        format.html { render :edit }
        format.json { render json: @businesssettled.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @businesssettled.destroy
    respond_to do |format|
      format.html { redirect_to businesssettleds_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_businesssettled
    @businesssettleds = Businesssettled.all
    @businesssettled = Businesssettled.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def businesssettled_params
    params.require(:businesssettled).permit(:name, :phonenumber, :summary, :status, :remarks)
  end

end
