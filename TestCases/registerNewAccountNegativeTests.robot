*** Settings ***
Documentation    DDT negative tests of registering new account
Library          SeleniumLibrary
Library          DataDriver    ../Data/UserData.xlsx    sheet_name=Sheet1
Resource         ../Resources/common.resource
Resource         ../Resources/register_resources.resource

Suite Setup      Open my browser    ${REGISTER_URL}
Test Template    Invalid register data

*** Test Cases ***
Registering with Excel

*** Keywords ***
Invalid register data
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}    ${confirm_password}    ${error}
    Input first and last name    ${first_name}    ${last_name}
    Fill email field    ${email}
    Fill new password    ${password}    ${confirm_password}
    Press register button
    element should be visible    ${error}