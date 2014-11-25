Feature: login page
  
    Scenario: new user tries to Sign in
      Given I am a new user
      And I load the home page
      When I press "Sign in"
      Then the Sign in page is loaded
      And I fill in "session_name" with "shouldntwork@asdf.com"
      And I fill in "session_password" with "asdfasdf"
      When I press "Log in"
      Then I should see "Invalid email/password combination"
      
    Scenario: valid user tries to Sign in
      Given I am a valid user
      Then the Sign in page is loaded
      And I fill in "session_name" with "asdf@asdf.com"
      And I fill in "session_password" with "asdfasdf"
      When I press "Log in"
      Then I should see "Event Details:"
      