Feature: Dashboard 
  In order to navigate Tenniscity
  you must either sign in or 
  Sign up for a new account
    
  Scenario: When entering the site
    Given I am a new, authenticated user
    And I go to the dashboard page
    Then should see "Dashboard"