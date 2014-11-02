require 'test_helper'

class EventTest < ActiveSupport::TestCase
  def setup
    @user = users(:matt)
    @event = Event.new(title: "Example", event_thumb: 2, venue: "Downtown", 
      when_at: "Tuesday night", total_tickets: 350, available_tickets:12)
    @event2 = @user.events.build(title: "Example", event_thumb: 2, venue: "Downtown", 
      when_at: "Tuesday night", total_tickets: 350, available_tickets:12)
  end
  
  test "event should be valid" do
    assert @event.valid?
  end
  
  test "event2 should be valid" do
    assert @event2.valid?
  end
  
  test "event missing title" do
    @event.title = ""
    assert_not @event.valid?
  end
  
  test "event thumb out of range" do
    @event.title = "Example"
    @event.event_thumb = 12
    assert_not @event.valid?
  end
  
  test "missing venue" do
    @event.event_thumb = 2
    @event.venue = ""
    assert_not @event.valid?
  end
    
  test "missing when at" do
    @event.venue = "Downtown"
    @event.when_at = ""
    assert_not @event.valid?
  end
    
  test "No tickets offered" do
    @event.when_at = "Tuesday night"
    @event.total_tickets = 0
    assert_not @event.valid?
  end
  
  test "available tickets out of range" do
    @event.total_tickets = 350
    @event.available_tickets = -1
    assert_not @event.valid?
  end
  
 
    
    
  
  
 
    
end
