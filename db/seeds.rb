# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


15.times do |n|
  name = "example-#{n+1}@asu.edu"
  password = "password"
  User.create!(name:  name,
              password:              password,
              password_confirmation: password,)
end

users = User.order(:created_at).take(6)
5.times do
  title = "Fun event"
  event_thumb = 2
  venue = "Arena"
  when_at = 13.days.from_now
  total_tickets = 50
  available_tickets = 25
  users.each { |user| user.events.create!(title: title, event_thumb: event_thumb,
    venue: venue, when_at: when_at, total_tickets: total_tickets, 
    available_tickets: available_tickets) }

end
