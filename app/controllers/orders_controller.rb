class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper
  include AdduserHelper

  # GET /orders
  # GET /orders.json
  def index
    @title = "Отследить груз"
    unless params[:q].blank?
      params[:q][:code_eq] = params[:q][:code_eq].upcase.strip.gsub(/[СТЕКМНРАВХ]/, 'С'=> 'C','Т'=> 'T','Е'=> 'E','К'=> 'K','М'=> 'M','Н'=> 'H','Р'=> 'P','А'=> 'A','В'=> 'B','Х'=> 'X')
      @search = Order.search(params[:q])
      @orders = @search.result
    else
      @search = Order.none.search
      @orders = []
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @title = 'Заявка на забор груза'
  end

  # GET /orders/1/edit
  def edit
    @title = 'Редактировать заявку'
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    new_user_password = ""
    @is_new_user = false
    if user_signed_in?
      @order.user_id = current_user.id
      @order.person = "#{current_user.family} #{current_user.name} #{current_user.otch}"
      @order.email = current_user.email
    else
      new_user_password = gen_password
      @order.user_id = add_user(@order.person, @order.email, new_user_password)

      puts "---------------------------------"
      puts "It's new: #{@is_new_user}, #{new_user_password}"
      new_user_password = (@is_new_user) ? new_user_password : ""
      puts "It's new: #{@is_new_user}, #{new_user_password}"
      puts "---------------------------------"
    end
    code = order_code(@order)
    @order.code = code
    @order.status_id = 1
    respond_to do |format|
      if @order.save
        # redirect_to :profile_path
        format.html { redirect_to root_path, notice: 'Заявка создана.' }
        # format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
    orderuser = User.find_by_id(@order.user_id)
    ApplicationMailer.new_order(@order, orderuser, new_user_password).deliver
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

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def ransack_params
      if params[:q].blank?
        Order.empty_results.search
      else
        Order.search(params[:q])
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:cargo_id,
        :weight,
        :volume,
        :amount,
        :from_city,
        :to_city,
        :dt,:shipper,
        :shipper_person,
        :shipper_phone,
        :shipper_address,
        :consignee,
        :consignee_person,
        :consignee_phone,
        :consignee_address,
        :payment_id,
        :payer,
        :details,
        :person,
        :email,
        :frail,
        :oversized,
        :kladr_from,
        :kladr_to)

        # ,:code, :status_id, :user_id
    end
end
