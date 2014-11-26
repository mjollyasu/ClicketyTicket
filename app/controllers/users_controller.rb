class UsersController < ApplicationController
 
  #skip_before_filter :require_login, :except=>[:new,:create]
  skip_before_filter :require_login, :only=>[:show]
  
  #helper_method :current_event
  
  # $current_event
  # $current_user
    
    
    def show
    $current_user = @user
    if ! $current_user.nil? && $current_user.id != params[:id]
      @user = User.find($current_user.id) #$current_user.id
    else
      @user = User.find(params[:id])
    end

    
 
  
    #@events = @user.events

    #@events = Event.all
    @events = Event.where('when_at >= (?)', DateTime.now.beginning_of_day ).all
    @events = @events.where('available_tickets > 0').all
    
    @order = Order.new
    
    @orders = Order.where( 'orders.user_id = (?)', @user.id ).joins(:event).order('events.when_at').all
    
    
    #ScheduledCourse.joins(:course).order('courses.name')
    #@userevents = Event.orders.where( 'user_id == (?)', @user.id ).all
      
    #else
      #redirect_to root_url
    #end
    
  end
 
  def current_event
    #puts params[:event_id]
    #puts params[:id]
    $current_event = Event.find_by(id: params[:event_id]) 
    
    #raise TypeError, $current_event.id
    
    head :ok, content_type: "text/html"
    
  end
  
  def new
    @user = User.new
    # @order = Order.new
    $current_user = @user
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
