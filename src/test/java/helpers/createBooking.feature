@regresion
Feature: Creates a new booking

  Scenario: Creates a new booking in the API
    Given url apiUrl
    And path '/booking'
    And request
  """
{
    "firstname" : "Jim",
    "lastname" : "Brown",
    "totalprice" : 111,
    "depositpaid" : true,
    "bookingdates" : {
        "checkin" : "2018-01-01",
        "checkout" : "2019-01-01"
    },
    "additionalneeds" : "Breakfast"
}
  """
    When header Content-Type = "application/json"
    And header Accept = "application/json"
    And method Post
    Then status 200
    And def bookingid = response.bookingid
    And match response.bookingid == "#number"