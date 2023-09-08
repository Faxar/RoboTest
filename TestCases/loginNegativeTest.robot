*** Settings ***
Documentation    A test suite with DDT approach of invalid login
Library          SeleniumLibrary
Resource         ../Resources/login_resources.robot
Resource         ../Resources/common.resource
Suite Setup      Open my Browser    ${LOGIN_URL}
Suite Teardown   Close Browsers
Test Template    Invalid login

*** Test Cases ***           username               password
Right user empty password    admin@yourstore.com    ${EMPTY}
Right user wrong password    admin@yourstore.com    test
Wrong user right password    ad@yourstore.com       admin
Empty user right password    ${EMPTY}               admin


*** Keywords ***
Invalid login
    [Arguments]    ${username}    ${password}
    Input username    ${username}
    Input password    ${password}
    Click login button
    Error message should be visible