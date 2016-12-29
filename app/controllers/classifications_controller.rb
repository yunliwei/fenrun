class ClassificationsController < ApplicationController



    before_action :set_classification, only: [:show, :edit, :update, :destroy]
    def index
      @classifications = Classification.all



    end
    # GET /chapters/1
    # GET /chapters/1.json
    def show
    end
    # GET /chapters/new
    def new
      @classification  = Classification.new
    end
    # GET /chapters/1/edit
    def edit
      @ware = Classification.find(params[:id])
      @cla=@ware.wares
      debgger
    end
    # POST /chapters
    # POST /chapters.json
    def create
      @classification = Classification.new(classification_params)

      respond_to do |format|
        if @classification.save
          format.html { redirect_to classifications_path, notice: 'Admin was successfully created.' }
          format.json { render :index, status: :created, location: @classification }
        else
          format.html { render :new }
          format.json { render json: @classification.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @classification.update(classification_params)
          format.html { redirect_to classifications_path, notice: 'Test was successfully updated.' }
          format.json { render :index, status: :ok, location: @classification }
        else
          format.html { render :edit }
          format.json { render json: @classification.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @classification.destroy
      respond_to do |format|
        format.html { redirect_to classifications_url, notice: 'Test was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_classification
      @classification = Classification.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def classification_params
      params.require(:classification).permit(:classname)
    end



end
