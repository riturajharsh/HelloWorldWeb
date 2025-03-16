Feature: Sample Feature
  Scenario: Verify greeting API
    Given the application is running
    When I send a GET request to "/greeting"
    Then the response should contain "Hello, World"
