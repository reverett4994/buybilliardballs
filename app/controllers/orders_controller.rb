class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!,only: [:index,:show,:new, :edit,:create, :update, :destroy,:checkout]

  require "braintree"
  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = "vdwxr4xstmt6dk94"
  Braintree::Configuration.public_key = "trw6txg35tdmh6zb"
  Braintree::Configuration.private_key = "6e3e04209609f798bc8fd119966782ae"
  skip_before_filter :verify_authenticity_token, :only => [:checkout]

  # GET /orders
  # GET /orders.json
  def index
    if current_user.email=="admin@billiardballs.com"
      @orders = Order.all
      @orders=@orders.order("created_at DESC")

    else
      @orders= Order.where("user_id LIKE ?",current_user)
      @orders=@orders.order("created_at DESC")
    end

  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if  current_user.email!="admin@billiardballs.com"
      if current_user != @order.user
        redirect_to root_path
      end
    end
    @counts = Hash.new 0
    @order.balls.each do |word|
      @counts[word.title] += 1
    end
  end

  # GET /orders/new
  def new
    @order = current_user.orders.build
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_user.orders.build(order_params)


    respond_to do |format|
      if @order.save
        OrderMailer.order(current_user.first_name,current_user.email).deliver
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def contact

  end

  def send_mail
    @subject=params[:subject]
    @message=params[:message]
    @email=params[:email]

    if @subject.length<2
      redirect_to contact_path,alert:'Please Fill in All Fields'
    elsif @message.length<2
      redirect_to contact_path,alert:'Please Fill in All Fields'
    elsif @email.length<2
      redirect_to contact_path,alert:'Please Fill in All Fields'
    end

    OrderMailer.contact(@subject,@message,@email).deliver
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def checkout



      ####### GOAL FOR NOW IS TO MAKE CUSTOM FORM AND INPUT FIELDS BELOW USING PARAMS AND THEN SHOW THOS PARAMS ON THE CHECKOUT PAGE#######

      nonce = params[:payment_method_nonce]
      result = Braintree::Transaction.sale(
      :amount => current_user.cart.total, #could be any other arbitrary amount captured in params[:amount] if they weren't all $10.
      :payment_method_nonce => nonce,
      :customer => {
      :first_name => params[:first_name],
      :last_name => params[:last_name],
      :email => params[:customer_email]
      },
      :billing => {
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :street_address => params[:street],
        :locality => params[:city],
        :region => params[:state],
        :postal_code => params[:zip],
        :country_code_alpha2 => "US"
      },
      :shipping => {
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :street_address => params[:street],
        :locality => params[:city],
        :region => params[:state],
        :postal_code => params[:zip],
        :country_code_alpha2 => "US"
      },
      :options => {
        :submit_for_settlement => true
        }
      )
    if result.success?
        transaction = result.transaction
        @sale_id=result.transaction.id
        @payment=transaction.payment_instrument_type
        @payment.gsub!('_',' ')
        @email=params[:customer_email]
        @first_name=params[:first_name]
        @last_name=params[:last_name]
        @street=params[:street]
        @city=params[:city]
        @state=params[:state]
        @zip=params[:zip]
        @amount=current_user.cart.total
        @cart=current_user.cart
        @order=Order.new(price:@amount,ship_street:@street,ship_city:@city,ship_state:@state,ship_zip:@zip,user_id:current_user.id,sale_id:@sale_id,payment_type:@payment)

        @cart.balls.each do |ball|
          @order.balls << Ball.find(ball.id)
        end



        @order.save!
        OrderMailer.order(current_user.first_name,current_user.last_name,current_user.email,@order.sale_id,@order.id).deliver

        #CREATE ORDER BEFORE EMPTIYING CART TO GET ITEMS ORDERD
        @cart.total=0
        @cart.balls=[]
        @cart.save
        redirect_to @order
    else
        @something=result.message
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:price, :ship_street, :ship_city, :ship_state, :ship_zip, :shipping,{:balls_ids => []})
    end
end
