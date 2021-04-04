@Test
Feature: Login 

@Loginscreen
Scenario: Verify Login
Given open web "https://tap-dev.tripatra.com/"
Then user input username
And user input password
And user click on Sign In button
Then I should see homepage as "Super Administrator - All Projects"