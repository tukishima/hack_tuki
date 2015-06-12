class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def drop
  end

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
    @picture = Picture.new
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json 

  def create
    #Saving to Amazon S3
    @picture = Picture.new(picture: params[:file], backup: params[:file])
    
    #NOT saving to Amazon S3
    # @picture = Picture.new(picture: params[:file])

    if @picture.save!
      p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      p @picture
      p @picture.picture.file
      respond_to do |format|
        format.json{ render :json => @picture }
      end
    end
  end




 #  def create
 # #   @picture = Picture.new(picture_params)
 #  #  binding.pry
 #    respond_to do |format|
 #      if true
 #        p "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
 #        # @picture.picture = picutre_params[:picture]
 #        # @picture.save
        
 #        params[:picture]['picture'].each {|param|
 #          p "================="
 #          p param

 #          @picture = Picture.new(picture_params)
 #          p @picture.class
 #          p @picture.picture.class
 #          @picture.picture = param
 #          @picture.save
 #          p "================="
 #        }
        
 #        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
 #        format.json { render :show, status: :created, location: @picture }
 #      else
 #        format.html { render :new }
 #        format.json { render json: @picture.errors, status: :unprocessable_entity }
 #      end
 #    end
 #  end

 # def create
 #  p "--------------"
 #  p params[:file]
 #  p "--------------"
 #    @picture = Picture.new(picture: params[:file])
 #    if @picture.save
 #      respond_to do |format|
 #        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
 #        format.json { render :show, status: :ok, location: @picture }
 #      end
 #    else
 #      respond_to do |format|
 #        format.html { render :new }
 #        format.json { render json: @picture.errors, status: :unprocessable_entity }
 #      end
 #    end
 #  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:picture)
    end
end
