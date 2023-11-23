@regresion
Feature: operaciones de refound

  Background: obtenemos el token
    Given url apiUrl
    Then def preauthResponse = call read('classpath:CARD/charges/card.feature')
    Then def ticketNumber = preauthResponse.ticketNumber
    Then print "****** " + ticketNumber

  Scenario: refound del charge
    Given path '/card/refund/',ticketNumber
    When header Private-Merchant-Id = privateID
    When method Delete
    Then status 201
