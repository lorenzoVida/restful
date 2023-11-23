@regresion
Feature: obtener el token

  Scenario: obtenemos el token
    Given url apiUrl
    Given path '/auth'
    Given request
  """
{
    "username" : "admin",
    "password" : "password123"
}
  """
    When header Content-Type = "application/json"
    When method Post
    Then status 200
    Then def authtoken = response.token

    Scenario: bad user
      Given url apiUrl
      Given path '/auth'
      Given request
  """
{
    "username" : "basUser",
    "password" : "password123"
}
  """
      When header Content-Type = "application/json"
      When method Post
      Then status 200