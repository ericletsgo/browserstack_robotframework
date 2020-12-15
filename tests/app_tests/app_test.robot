*** Settings ***
Documentation     A test suite with a single Gherkin style test.
...
...               This test is functionally identical to the example in
...               valid_login.robot file.
Resource          resource.robot

*** Variables ***
${name}                        app_test

*** TEST CASES ***
Open App To Login Page and the page should be open
    Open App through BrowserStack
    Page Should Contain Text    UI Elements
