@regresion
Feature: Get ping

  Scenario: get ping OK
    Given url apiUrl
    Given path '/ping'
    Given request
    When header Content-Type = "application/json"
    When method Get
    Then status 201
    And match response == 'Created'

