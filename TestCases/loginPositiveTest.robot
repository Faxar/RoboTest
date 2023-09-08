*** Settings ***
Documentation     A single test of valid login
Library           SeleniumLibrary
Resource          ../Resources/login_resources.robot
Resource          ../Resources/common.resource

*** Test Cases ***
Valid login
    Given Open my Browser  ${LOGIN_URL}
    When User logs in with password    ${VALID_USER}    ${VALID_PASSWORD}
    Then Dashboard is visible

*** Keywords ***
User logs in with password
        [Arguments]     ${username}     ${password}
        Input username    ${username}
        Input password    ${password}
        Click login button