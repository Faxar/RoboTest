*** Settings ***
Documentation    A single positive test of currency change
Library          SeleniumLibrary
Resource         ../Resources/common.resource

*** Variables ***
${EURO_CURRENCY_SIGN}    €


*** Test Cases ***
Change currency from Dollars to Euro
    Given Open prices page    ${MAIN_PAGE}
    When Change currency
    Then Prices should be in Euro

*** Keywords ***
Change currency
    select from list by label    customerCurrency    Euro

Prices should be in Euro
    element should contain    xpath://span[contains(text(),'€1032.00')]    ${EURO_CURRENCY_SIGN}
    close all browsers

Open prices page
    [Arguments]        ${navigate_to_page}
    Open my Browser    ${navigate_to_page}
    go to     https://demo.nopcommerce.com/desktops