user = nil


require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation

Before do
    DatabaseCleaner.start
    user = User.create(name:"test@test.com", password:"asdfasdf", password_confirmation:"asdfasdf")
end

Given(/^I am a new user$/) do
    if first(:css, '#logout') != nil
        click_button "logout"
    end
end

Given(/^I load the home page$/) do
    visit "/"
end

Then(/^the same home page is loaded$/) do
    #page.should have_content("Clickety Ticket")
    expect(page).to have_content("Clickety Ticket")
end

Then(/^I should see "([^"]*)"$/) do |content|
    expect(page).to have_content content
end

Then(/^the Sign up page is loaded$/) do
    visit "/signup"
    expect(page).to have_content("Confirmation")
end

Then(/^the Sign in page is loaded$/) do
    visit "/login"
    expect(page).to have_content("New user?")
end

Then(/^the user dashboard is loaded$/) do
    visit "/users/16" 
    expect(page).to have_content("Event Details")
end

When(/^I press "(.*?)"$/) do |button|
    click_button(button)
end

Given(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
    fill_in(field, :with => value)
end

#Given(/^I am logged in$/) do
#    visit "/login"
#    fill_in "session_name", :with => user.name
#    fill_in "session_password", :with => user.password
    #click_button "Log in"
    #find("Log in").click
    
#end

Given(/^I am a valid user$/) do
    visit "/signup"
    fill_in "user_name", :with => "asdf@asdf.com"
    fill_in "user_password", :with => "asdfasdf"
    fill_in "user_password_confirmation", :with => "asdfasdf"
    click_button "Create my account"
end

After do
    DatabaseCleaner.clean
end
















