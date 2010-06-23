Feature: Manage Leagues
  In order to create a new league
  A current tennis city member
  need to setup a league
  
  Scenario: Create a new league
    Given I am on the new league page
    When I fill in the following:
      | name        | Test League |
      | length      | 10          |
      | start_date  | 2010-07-30  |
