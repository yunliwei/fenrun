class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users =User.all.order("updated_at DESC").paginate(page:params[:page],per_page:3)
    @usercount=@users.count
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show

  end

  # GET /subjects/new
  def new
    @user = User.new
  end

  # GET /subjects/1/edit
  def edit

    @user = User.find(params[:id])

  end

  # POST /subjects
  # POST /subjects.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Subject was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.all
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :username, :phonenumber, :referee_id, :phonenumber, :sex, :birthday, :age, :email, :wecharnumber,:menber, :localarea, :state, :canuserebate, :codetime,:code,:headpicture,:rebate,:summationamount)
  end
end
