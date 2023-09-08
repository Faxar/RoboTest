*** Settings ***
Documentation    A single positive test of registering new account
Library          SeleniumLibrary
Library          String
Resource         ../Resources/register_resources.resource
Resource         ../Resources/common.resource


*** Test Cases ***
Register new account
    Given Open register page and fill data
    When Press register button
    Then Succesfull registration appear


*** Keywords ***
Open register page and fill data
    Open my Browser    ${REGISTER_URL}
    Select gender
    Input first and last name     Generate random name          Generate random name
    Autofill date of birth
    Autofill email field
    Autofill new password

Succesfull registration appear
    page should contain    Register
