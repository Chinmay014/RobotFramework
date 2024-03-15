*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.ebay.com
${browser}  chrome

*** Keywords ***
Start Testcase
    Open Browser  ${url}  ${browser}
    Maximize Browser Window

Finish Testcase
    Close Browser