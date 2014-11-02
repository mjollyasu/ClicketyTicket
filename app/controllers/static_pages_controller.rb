class StaticPagesController < ApplicationController
  def landing
  end

  def home
    @event = Event.new
  end
end
