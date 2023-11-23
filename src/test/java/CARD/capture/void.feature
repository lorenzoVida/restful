Feature: operaciones de refound

  Background: obtenemos el token
    Given url apiUrl
    Then def preauthResponse = call read('classpath:CARD/preauth/preauth.feature')
    Then def ticketNumber = preauthResponse.ticket
    Then print "****** " + ticketNumber

  Scenario: void del charge
    Given path '/card/v1/charges/{{ticketNumber}}'
    Given request
"""
{
  "fullResponse": true,
  "amount": {
    "subtotalIva": 1055,
    "subtotalIva0": 0,
    "ice": 0,
    "iva": 0,
    "currency": "##(currency)"
  }
}
  """
    When header Private-Merchant-Id = privateID
    When method Delete
    Then status 201
    Then def transactionReference = response.transactionReference

