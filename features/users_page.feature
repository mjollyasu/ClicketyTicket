  Feature: users page
    
    Scenario: valid user tries to book an event
      Given I am a valid user
      Then the Sign in page is loaded
      And I fill in "session_name" with "asdf@asdf.com"
      And I fill in "session_password" with "asdfasdf"
      When I press "Log_in"
      Then the user dashboard is loaded
      When I press "Book it!"
      And I fill in "order_tickets_purchased" with "1"
      And I press "Create Order"
      Then I should see "Order was successfully created."