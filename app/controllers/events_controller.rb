class EventsController < ApplicationController
  
  def index
    #@events = Event.all
    #@events = Event.where('when_at BETWEEN ? AND ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day).all
    @events = Event.where('when_at >= (?)', DateTime.now.beginning_of_day ).all
    #@events = @events.where('title == (?)', "Sporting Event 2" ).all
    @events = @events.where('available_tickets > 0').all
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.events.build(event_params)
    
    respond_to do |format|
      if @event.save
        #redirect_to @event
        format.html { redirect_to events_new_url, notice: 'Event was successfully created.' }
        flash[:success] = "Event created"
      else
        render 'new'
      end
    end
  end
  
  def destroy
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :event_thumb, :venue, :when_at,
        :total_tickets, :available_tickets)
    end
end
