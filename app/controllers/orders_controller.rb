class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  #def index
  #  @orders = Order.all
  #end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @orders = Order.all
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    
    @order = Order.new(order_params)
    
    $current_user ||= User.find_by(id: session[:user_id])
    @order.user_id = $current_user.id
    #@order.user_id = session[:user_id]
    
    #$current_event = Event.find_by(id: users[:event_id])
      
    respond_to do |format|
      
      if ! $current_event.nil?
        
        @order.event_id = $current_event.id
      
        if @order.tickets_purchased <= $current_event.available_tickets &&  @order.tickets_purchased >= 1
          $current_event.available_tickets -= @order.tickets_purchased
          
          if @order.save && $current_event.save
            #format.html { render "/users/#{$current_user.id}", notice: 'Order was successfully created.' }
            format.html { redirect_to $current_user, notice: 'Order was successfully created.' }
            format.json { render :show, status: :created, location: $current_user }
          else
            format.html { redirect_to $current_user, notice: 'Unable to process order.' } #"/users/#{$current_user.id}" }
            format.json { render :show, status: :unprocessable_entity, location: $current_user }
            #format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        else
          #flash.now[:danger] = "Unable to process order - ordering more tickets than available"
          format.html { redirect_to $current_user, notice: 'Unable to process order - ordering more tickets than available.' }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      
      else
      
        format.html { redirect_to $current_user, notice: 'Unknown error.' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        #format.html { redirect_to $current_user, notice: 'Unable to process order.' }
        #format.json { render :show, status: :unprocessable_entity, location: $current_user }
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
      params.require(:order).permit(:user_id, :event_id, :tickets_purchased)
    end
end
