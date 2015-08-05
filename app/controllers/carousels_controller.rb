class CarouselsController < ApplicationController
  before_action :set_carousel, only: [:show, :edit, :update, :destroy]

  # GET /carousels
  # GET /carousels.json
  def index
    @carousels = Carousel.all
    @carousel= Carousel.new
  end

  # GET /carousels/1
  # GET /carousels/1.json
  def show
  end

  def publish
    if params[:is_published].nil?
        redirect_to carousels_path
    else
        @carousel = Carousel.find(params[:is_published])
        if params[:publish]
          @carousel.each do |carousel|
            carousel.update_attributes!(:is_published => true)
          end
          redirect_to carousels_path
        elsif params[:unpublish]
          unpublish
        else
          destroy
        end
    end
  end

  def unpublish
    @carousel = Carousel.find(params[:is_published])
    @carousel.each do |carousel|
      carousel.update_attributes!(:is_published => false)
    end
    redirect_to carousels_path
  end

  def destroy
    Carousel.destroy(params[:is_published])
    respond_to do |format|
      format.html { redirect_to carousels_url, notice: 'Carousel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /carousels/new
  def new
    @carousel = Carousel.new
  end

  # GET /carousels/1/edit
  def edit
  end

  # POST /carousels
  # POST /carousels.json
  def create
    @carousel = Carousel.new(carousel_params)

    respond_to do |format|
      if @carousel.save
        format.html { redirect_to @carousel, notice: 'Carousel was successfully created.' }
        format.json { render :show, status: :created, location: @carousel }
      else
        format.html { render :new }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carousels/1
  # PATCH/PUT /carousels/1.json
  def update
    respond_to do |format|
      if @carousel.update(carousel_params)
        format.html { redirect_to @carousel, notice: 'Carousel was successfully updated.' }
        format.json { render :show, status: :ok, location: @carousel }
      else
        format.html { render :edit }
        format.json { render json: @carousel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carousels/1
  # DELETE /carousels/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carousel
      @carousel = Carousel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carousel_params
      params.require(:carousel).permit(:image, :name)
    end
end
