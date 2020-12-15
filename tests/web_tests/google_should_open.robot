*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.robot file.
Resource          resource.robot
Test Teardown     Close Browser

*** Variables ***
${name}                        google_test

*** TEST CASES ***
Open Browser To Login Page and the page should be open
    Open Browser through BrowserStack
    Google Should Be Open