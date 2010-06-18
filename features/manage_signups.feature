Feature: Manage Users
  In order to [goal]
  [stakeholder]
  wants [behaviour]
    
  Scenario: When entering the site
      When I go to the home page
      Then I should see "You need to sign in or sign up before continuing."
      
  Scenario: Creating a new account
      Given I am not authenticated
      When I go to the the new user registration page
      And I fill in "user_email" with "<email>"
      And I fill in "user_password" with "<password>"
      And I fill in "user_password_confirmation" with "<password>"
      And I press "Sign up"
      Then I should see "<email>"

      | email           | password   |
      | testing@man.net | secretpass |
      | foo@bar.com     | fr33z3     |

  Scenario: Wanted to edit my account
      Given I am a new, authenticated user
      When I want to edit my account
      Then I should see the account initialization form
      And I should see "Your account has not been initialized yet. Do it now!"
      And more view checking stuff

  # Rails generates Delete links that use Javascript to pop up a confirmation
  # dialog and then do a HTTP POST request (emulated DELETE request).
  #
  # Capybara must use Culerity or Selenium2 (webdriver) when pages rely on
  # Javascript events. Only Culerity supports confirmation dialogs.
  # 
  # cucumber-rails will turn off transactions for scenarios tagged with 
  # @selenium, @culerity, @javascript or @no-txn and clean the database with 
  # DatabaseCleaner after the scenario has finished. This is to prevent data 
  # from leaking into the next scenario.
  #
  # Culerity has some performance overhead, and there are two alternatives to using
  # Culerity:
  #
  # a) You can remove the @culerity tag and run everything in-process, but then you 
  # also have to modify your views to use <button> instead: http://github.com/jnicklas/capybara/issues#issue/12
  #
  # b) Replace the @culerity tag with @emulate_rails_javascript. This will detect
  # the onclick javascript and emulate its behaviour without a real Javascript
  # interpreter.
  #
  # @culerity
  # Scenario: Delete signin
  #   Given the following signins:
  #     ||
  #     ||
  #     ||
  #     ||
  #     ||
  #   When I delete the 3rd signin
  #   Then I should see the following signins:
  #     ||
  #     ||
  #     ||
  #     ||