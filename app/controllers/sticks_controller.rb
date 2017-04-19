class SticksController < ApplicationController
  before_action :set_stick, only: [:show, :edit, :update, :destroy]

  # GET /sticks
  # GET /sticks.json
  def index
    @sticks = Stick.all
  end

  # GET /sticks/1
  # GET /sticks/1.json
  def show
  end

  # GET /sticks/new
  def new
    @stick = Stick.new
  end

  # GET /sticks/1/edit
  def edit
  end

  # POST /sticks
  # POST /sticks.json
  def create
    @stick = Stick.new(stick_params)

    respond_to do |format|
      if @stick.save
        format.html { redirect_to @stick, notice: 'Stick was successfully created.' }
        format.json { render :show, status: :created, location: @stick }
      else
        format.html { render :new }
        format.json { render json: @stick.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sticks/1
  # PATCH/PUT /sticks/1.json
  def update
    respond_to do |format|
      if @stick.update(stick_params)
        format.html { redirect_to @stick, notice: 'Stick was successfully updated.' }
        format.json { render :show, status: :ok, location: @stick }
      else
        format.html { render :edit }
        format.json { render json: @stick.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sticks/1
  # DELETE /sticks/1.json
  def destroy
    @stick.destroy
    respond_to do |format|
      format.html { redirect_to sticks_url, notice: 'Stick was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stick
      @stick = Stick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stick_params
      params.require(:stick).permit(:title, :color, :length, :weight, :price, :image)
    end
end
