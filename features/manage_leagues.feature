Feature: Manage Leagues
  In order to create a new league
  A current tennis city member
  need to setup a league
  
  Scenario: Create a new league
    Given I am a new, authenticated user
    And I am on the new league page
    When I fill in the following:
      | league_name       | Test League |
      | league_length     | 10          |
      | league_start_date | 2011-11-11  |
    And I press "Create"
    Then I should see "League has been successfully created! Once all the teams have been confirmed you can proceed to the draft."
