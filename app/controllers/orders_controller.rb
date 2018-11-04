class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
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

    if user_signed_in?
      @order.user_id = current_user.id
      @order.person = "#{current_user.family} #{current_user.name} #{current_user.otch}"
      @order.email = current_user.email
    elsif User.where(email: "rus@5g.su").take!
      u = User.where(email: "rus@5g.su").take
      @order.user_id = u.id
      @order.person = "#{u.family} #{u.name} #{u.otch}"
      @order.email = current_user.email
    else
    end

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
        :user_id)
    end
end
