Feature: home page
  
   Scenario: load homepage
        Given I am a new user
        And I load the home page
        Then the same home page is loaded
        
    Scenario: new user finds signin and signup
        Given I am a new user
        And I load the home page 
        Then I should see "Sign up"
        And I should see "Sign in"
        
    Scenario: new user navigates to signup
      Given I am a new user
      And I load the home page
      When I press "Sign up"
      Then the Sign up page is loaded
      And I should see "Name"
      And I should see "Password"
      And I should see "Confirmation"
      
    Scenario: new user navigates to sign in
      Given I am a new user
      And I load the home page
      When I press "Sign in"
      Then the Sign in page is loaded
      And I should see "Name"
      And I should see "Password"
      And I should see "New user?"
 

      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      