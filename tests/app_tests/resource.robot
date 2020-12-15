*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           AppiumLibrary

*** Settings ***
Library      AppiumLibrary
Library      OperatingSystem
Library      String
Library      Collections
Library      BuiltIn


*** Variables ***
${SERVER}                      localhost:7272
${DELAY}                       0
${VALID USER}                  demo
${VALID PASSWORD}              mode
${LOGIN URL}                   http://${SERVER}/
${WELCOME URL}                 http://${SERVER}/welcome.html
${ERROR URL}                   http://${SERVER}/error.html
${baseUrl}                     http://www.google.com
${osVersion}                   14
${device}                      iPhone 12
${app}                         bs://444bd0308813ae0dc236f8cd461c02d3afa7901d
${build}                       robotframework
${project}                     robotframework
${browserstack_userName}       ericwang12
${browserstack_accessKey}      MVztxmZaCjR51Sygtmhp
${browserstack.seleniumLogs}   true
${browserstack.appiumLogs}     true
${browserstack.networkLogs}    true
${acceptSslCert}               false


*** Keywords ***
Open App through BrowserStack
    ${remoteUrl}                Set Variable        http://${browserstack_userName}:${browserstack_accessKey}@hub.browserstack.com:80/wd/hub
    Open Application  remote_url=${remoteUrl}     os_version=${osVersion}  device=${device}    name=${name}    project=${project}    build=${build}    app=${app}

Google Should Be Open
    Title Should Be     Google

Open Browser To Login Page
    Go To    ${LOGIN URL}   
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page

