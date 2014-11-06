class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    #@events = @user.events

    #@events = Event.all
    @events = Event.where('when_at >= (?)', DateTime.now.beginning_of_day ).all
    #@events = @events.where('title == (?)', "Sporting Event 2" ).all
    @events = @events.where('available_tickets > 0').all
    
  end
  
  def place_order_event
    @TESTVAL = 7
  end
  
  def new
      @user = User.new
  end
  
  def create
    @user = User.new(user_params)
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
