*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${REGISTER_URL}     https://demo.nopcommerce.com/register


*** Keywords ***
Open register page
    go to    ${REGISTER_URL}

Input first and last name
    [Arguments]    ${first_name}    ${last_name}
    input text    id:FirstName    ${first_name}
    input text    id:LastName     ${last_name}

Autofill date of birth
    select from list by index   DateOfBirthDay     1
    select from list by index   DateOfBirthMonth   3
    select from list by label   DateOfBirthYear    2000

Autofill email field
    input text    id:Email      test@test.test

Generate random name
    ${string}=  Generate Random String      8      [LETTERS]
    RETURN    ${string}

Autofill new password
    scroll element into view   id:register-button
    input text    Password     Generate random name
    input text    ConfirmPassword     Generate random name

Fill new password
    [Arguments]    ${password}    ${confirm_password}
    input text    Password     ${password}
    input text    ConfirmPassword     ${confirm_password}

Fill email field
    [Arguments]    ${email}
    input text    id:Email      ${email}

Press register button
    click button    id:register-button

Select gender
    select radio button    Gender     M

Fill register data
    [Arguments]    ${first_name}    ${last_name}    ${email}    ${password}    ${confirm_password}
    Input first and last name    ${first_name}    ${last_name}
    Fill email field    ${email}
    Fill new password    ${password}    ${confirm_password}