package com.example.restservice.steps;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import static org.junit.jupiter.api.Assertions.*;

public class GreetingSteps {
    private String response;

    @Given("the application is running")
    public void the_application_is_running() {
        // Here, you could check if the application is up (e.g., using a health check endpoint).
    }

    @When("I send a GET request to {string}")
    public void i_send_a_get_request_to(String endpoint) {
        // Simulating an API call (replace this with actual API call logic)
        response = "Hello, World";
    }

    @Then("the response should contain {string}")
    public void the_response_should_contain(String expected) {
        // Assertion to check if the response matches expectation
        assertEquals(expected, response);
    }
}
