@regresion
Feature: Login

  Scenario: Get Token
    Given url apiUrl
    And path '/auth'
    And request
  """
{
    "username" : "admin",
    "password" : "password123"
}
  """
    When header Content-Type = "application/json"
    And method Post
    Then status 200
    And def authtoken = response.token
    And  match response.token == "#string"

  Scenario: bad user
    Given url apiUrl
    And path '/auth'
    And request
  """
{
    "username" : "basUser",
    "password" : "password123"
}
  """
    When header Content-Type = "application/json"
    And method Post
    Then status 200
    And match response.reason contains 'Bad credentials'