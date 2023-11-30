
Feature: operaciones de capture pre auth

  Background: obtenemos el token
    Given url apiUrl
    Then def preauthResponse = call read('classpath:CARD/preauth/preauth.feature')
    Then def ticketNumbers = preauthResponse.ticket
    Then print "****** " + ticketNumbers

  Scenario: capture del pre auth
    Given path '/card/v1/capture'
    Given request
"""
{
    "ticketNumber": "##(ticketNumbers)",
    "amount": {
        "currency": "##(currency)",
        "iva": 0,
        "ice": 0
    },
    "fullResponse": true
}
  """
    When header Private-Merchant-Id = privateID
    When method Post
    Then status 201
