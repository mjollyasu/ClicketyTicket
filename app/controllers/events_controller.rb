class EventsController < ApplicationController
  
  def index
    #@events = Event.all
    #@events = Event.where('when_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
    @events = Event.where('when_at >= (?)', DateTime.now.beginning_of_day).all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      redirect_to @event
      flash[:success] = "Event created"
    else
      render 'new'
    end
  end
  
  def destroy
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :image_thumb, :venue, :when_at,
        :total_tickets, :available_tickets)
    end
end
