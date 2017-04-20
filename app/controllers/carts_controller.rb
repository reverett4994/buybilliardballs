class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  require "braintree"
  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = "vdwxr4xstmt6dk94"
  Braintree::Configuration.public_key = "trw6txg35tdmh6zb"
  Braintree::Configuration.private_key = "6e3e04209609f798bc8fd119966782ae"
   # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1n
  # GET /carts/1.json
  def show
    if current_user != @cart.user
      redirect_to root_path
    end
    @counts = Hash.new 0
    @cart.balls.each do |word|
      @counts[word.title] += 1
    end

    @counts_s = Hash.new 0
    @cart.sticks.each do |word|
      @counts_s[word.title] += 1
    end
  end

  def cart_order
    @token= Braintree::ClientToken.generate
    @amount=params[:amount]
    @counts = Hash.new 0
    @counts_s = Hash.new 0
    @cart=current_user.cart
    @cart.balls.each do |word|
      @counts[word.title] += 1
    end
    @cart.sticks.each do |word|
      @counts_s[word.title] += 1
    end
     gon.total = @cart.total
     gon.express=6
  end

  # GET /carts/new
  def new
    @cart = current_user.build_cart
    @ball=params[:ball]
    flash[:ball]=@ball

  end

  # GET /carts/1/edit
  def edit
  end
  def add
    @amount=params[:amount]
    @amount=@amount.to_i
    @carts = Cart.where("USER_ID LIKE ?",current_user.id)
    @cart=@carts.last
    @total=0
    if params[:chalk]!=nil
      @cart.chalk=true
    end
    if params[:ball]==nil
      @stick=params[:stick]
      @amount.times do
        @cart.sticks << Stick.find(@stick)
      end
    else
      @ball=params[:ball]
      @amount.times do
        @cart.balls << Ball.find(@ball)
      end
    end
    @cart.balls.each do |ball|
      @total+=ball.price
    end
    @cart.sticks.each do |stick|
      @total+=stick.price
    end
    if @cart.chalk==true
      @total+=1
    end

    @cart.total=@total
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end

  end
  # POST /carts
  # POST /carts.json
  def create
      @cart = current_user.build_cart(cart_params)
      @total=0
      @ball=flash[:ball]
      @cart.balls << Ball.find(@ball)
      @cart.balls.each do |ball|
        @total+=ball.price
      end
      @cart.total=@total
      respond_to do |format|
        if @cart.save
          format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
          format.json { render :show, status: :created, location: @cart }
        else
          format.html { render :new }
          format.json { render json: @cart.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.total=0
    @cart.balls=[]
    @cart.sticks=[]
    @cart.chalk=false
    @cart.save
    respond_to do |format|
      format.html { redirect_to balls_url, notice: 'Cart was successfully Emptied.' }
      format.json { head :no_content }
    end
  end

  def remove
    @total=0
    if params[:counter]==nil
      @counter=params[:counter_s]
      @carts=Cart.where("ID LIKE ?",params[:cart])
      @cart=@carts.last
      @original=@cart.sticks.length
      @original=@original-1
      @ball=Stick.find(@counter)
      @cart.sticks.delete(@ball)
      @cart.save
      while @cart.sticks.length < @original
          @cart.sticks << Stick.find(@ball)
      end
    else
      if params[:counter]=="chalk"
        @carts=Cart.where("ID LIKE ?",params[:cart])
        @cart=@carts.last
        @cart.chalk=false
        @cart.save
      else
        @counter=params[:counter]
        @carts=Cart.where("ID LIKE ?",params[:cart])
        @cart=@carts.last
        @original=@cart.balls.length
        @original=@original-1
        @ball=Ball.find(@counter)
        @cart.balls.delete(@ball)
        @cart.save
        while @cart.balls.length < @original
            @cart.balls << Ball.find(@ball)
        end
      end
    end


    @cart.balls.each do |ball|
      @total+=ball.price
    end
    @cart.sticks.each do |stick|
      @total+=stick.price
    end
    if @cart.chalk==true
      @total+=1
    end
    @cart.total=@total
    @cart.save
    redirect_to @cart
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:total)
    end
end
