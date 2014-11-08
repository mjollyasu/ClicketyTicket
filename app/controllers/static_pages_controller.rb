class StaticPagesController < ApplicationController
 
  #skip_before_filter :require_login, :except=>[:landing,:home]

  def landing
  end

  def home
    @event = Event.new
  end
end
