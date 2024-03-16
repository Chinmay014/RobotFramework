*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.ebay.com
${browser}  chrome

*** Keywords ***
Start Testcase
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Reload Browser
    Execute Javascript    window.location.reload()

Finish Testcase
    Close Browser