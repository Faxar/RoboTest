*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}        https://admin-demo.nopcommerce.com/
${VALID_USER}       admin@yourstore.com
${VALID_PASSWORD}   admin

*** Keywords ***
Open Login Page
    go to       ${LOGIN_URL}

Input username
    [Arguments]    ${username}
    input text    id:Email    ${username}

Input password
    [Arguments]    ${password}
    input text    id:Password    ${password}

Click login button
    click element    xpath://button[contains(text(),'Log in')]

Click logout button
    click link      Logout

Error message should be visible
    page should contain     Login was unsuccessful

Dashboard is visible
    page should contain     Dashboard