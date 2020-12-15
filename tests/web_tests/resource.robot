*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Settings ***
#Resource     ../../Common/keywords/Login_keywords.robot
#Resource     ../../Common/keywords/Header_Keywords.robot
# Library      CACAutomationLibrary.Webservice
Library      SeleniumLibrary
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
${baseUrl}                     www.google.com
${os}                          windows
${osVersion}                   8.1
${browser}                     IE
${browserName}                 IE
${browserVersion}              latest
# ${device}                      iPhone 8
# ${realMobile}                  true
${build}                       robotframework
${project}                     robotframework
${browserstack_userName}       ericwang12
${browserstack_accessKey}      MVztxmZaCjR51Sygtmhp
${browserstack.seleniumLogs}   true
${browserstack.appiumLogs}     true
${name}                        BS_Windows_8.1_IE_11.0
${browserstack.networkLogs}    true
${resolution}                  '1920x1200'
${acceptSslCert}               false
${browserstack.local}          true


*** Keywords ***
Open Browser through BrowserStack
    ${remoteUrl}                Set Variable        http://${browserstack_userName}:${browserstack_accessKey}@hub.browserstack.com:80/wd/hub
    &{desiredCapabilities}      Create Dictionary   os=${os}     os_version=${osVersion}     browser=${browser}    name=${name}    project=${project}    build=${build}     browserstack.local=${browserstack.local}
    Open Browser      ${baseUrl}    remote_url=${remoteUrl}     desired_capabilities=${desiredCapabilities}

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

