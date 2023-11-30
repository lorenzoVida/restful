@regresion
Feature: obtener libros

  Scenario: Get All id's
    Given url apiUrl
    And params {checkin:"2017-01-01",checkout:"2018-02-01"}
    And path '/booking'
    And request
    When header Content-Type = "application/json"
    And method Get
    Then status 200
    And match response == "#array"
 #   And match response == "#[1]"

  Scenario: obtenemos el libro
    Given url apiUrl
    And path '/booking'
    And request
    When header Content-Type = "application/json"
    And method Get
    Then status 200
    And match response == "#array"