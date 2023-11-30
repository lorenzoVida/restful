
Feature: operaciones de pre auth

  Background: obtenemos el token
    Given url apiUrl
    Then def tokenResponse = call read('classpath:helpers/createToken.feature')
    Then def token = tokenResponse.authtoken
    Then print "****** " + token

  Scenario: preauth
    Given path '/preAuthorization'
    Given request
  """
{
  "token": "##(token)",
  "amount": {
    "subtotalIva": 8,
    "subtotalIva0": 0,
    "ice": 0,
    "iva": 0,
    "currency": "##(currency)"
  },
  "fullResponse": true
}
  """
    When header Private-Merchant-Id = privateID
    When method Post
    Then status 201
    Then def ticket = response.ticketNumber




