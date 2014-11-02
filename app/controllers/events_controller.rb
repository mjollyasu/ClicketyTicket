class EventsController < ApplicationController
  
  def show
    @event = Event.find(params[:id])

  end
  
  def new
      @event = Event.new
  end
  
  def create
    @event = event.new(event_params)
    if @event.save
      flash[:success] = "Event created"
    else
      render 'new'
    end
  end
  
  private
  
    def event_params
      params.require(:event).permit(:title, :image_thumb, :venu, :when_at,
        :total_tickets, :available_tickets, :user)
    end
end
