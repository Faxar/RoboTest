*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MAIN_PAGE}        https://demo.nopcommerce.com/
${BROWSER}          chrome

*** Keywords ***
Open my Browser
    [Arguments]     ${page_url}
    open browser    ${page_url}    ${BROWSER}
    maximize browser window

Close Browsers
    close all browsers
