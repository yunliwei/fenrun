class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy]
  def index
    @settings = Setting.all
  end
  def new
    @setting = Setting.new
  end
  def edit
  end
  def create
    @setting = Setting.new(setting_params)
    respond_to do |format|
      if @setting.save
        format.html { redirect_to settings_path, notice: 'Admin was successfully created.' }
        format.json { render :index, status: :created, location: @setting }
      else
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to @setting, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end
# DELETE /tests/1
# DELETE /tests/1.json
  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to settings_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def set_setting
    @setting = Setting.find(params[:id])
  end
# Never trust parameters from the scary internet, only allow the white list through.
  def setting_params
    params.require(:setting).permit(:consumebase ,:memberratio, :agentratio, :refereeratio, :consumemin, :consumemax,:consumecash,:withdrawmin, :withdrawmax ,:withdrawratio)
  end

end
