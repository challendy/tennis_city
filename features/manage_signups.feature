Feature: Users Authentication
  In order to enter Tenniscity
  you must either sign in or 
  Sign up for a new account
    
  Scenario: When entering the site
      When I go to the home page
      Then I should see "You need to sign in or sign up before continuing."
      
  Scenario: Wanted to create a new account
      Given I am not authenticated
      When I go to the the new user registration page
      When I fill in the following:
        | user_email                  | test@gmail.com  |
        | user_password               | testtest        |
        | user_password_confirmation  | testtest        |
      And I press "Sign up"
      Then I should see "You have signed up successfully. A confirmation was sent to your e-mail."

  Scenario: Wanted to edit my account
      Given I am a new, authenticated user
      When I go to the account edit page
      Then I should see "Edit Account"
      
  Scenario: Wanted to cancel my account
    Given I am a new, authenticated user
    When I go to the account edit page
    # And I follow "Cancel my account"
    # Then I should see "Are you sure?"
