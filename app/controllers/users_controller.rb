class UsersController < ApplicationController
 
  #helper_method :current_event
  
  # $current_event
  # $current_user
    
  def show
    
    @user = User.find(params[:id])
    #@events = @user.events

    #@events = Event.all
    @events = Event.where('when_at >= (?)', DateTime.now.beginning_of_day ).all
    @events = @events.where('available_tickets > 0').all
    
    @order = Order.new
    
    @orders = Order.where('user_id >= (?)', @user.id ).all
    
  end
 
  def current_event
    #puts params[:event_id]
    #puts params[:id]
    $current_event = Event.find_by(id: params[:event_id]) 
  end
  
  def new
    @user = User.new
    # @order = Order.new
  end
  
  def create
    @user = User.new(user_params)
    # @orders = Order.all
    # @events = Event.where('when_at >= (?)', DateTime.now.beginning_of_day ).all
    # @events = @events.where('available_tickets > 0').all
        
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Clickety Ticket!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  # def tickets_sold(id)
  #   Order.where(:event_id == id).all.sum(:tickets_purchased)
  # end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
