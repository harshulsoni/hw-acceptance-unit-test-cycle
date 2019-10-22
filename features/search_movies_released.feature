Feature: search by release dates
 
  As a movie buff
  So that I can find all movies released after or before the current movies
  I want to search based on released date information in movies I enter
 
Background: movies in database
 
  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
 
Scenario: Movies released after the current movie
  Given I am on the details page for "Alien"
  And  I follow "Search Movies released after this movie"
  And   I should see "Blade Runner"
  But   I should not see "THX-1138"
 
Scenario: Movies released before the current movie
  Given I am on the details page for "Star Wars"
  And  I follow "Search Movies released before this movie"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"
 
Scenario: No movie released before the current movie (sad path)
  Given I am on the details page for "THX-1138"
  And  I follow "Search Movies released before this movie"
  But   I should not see "Alien"
  And   I should not see "Blade Runner"
  And   I should not see "Star Wars"

Scenario: No movie released after the current movie (sad path)
  Given I am on the details page for "Blade Runner"
  And  I follow "Search Movies released after this movie"
  But   I should not see "Alien"
  And   I should not see "THX-1138"
  And   I should not see "Star Wars"