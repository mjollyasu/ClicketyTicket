class StaticPagesController < ApplicationController
  def landing
  end

  def home
    @event = current_user.events.build
  end
end
