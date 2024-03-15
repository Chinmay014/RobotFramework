*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
This is sample test case
    [Documentation]  Google test
    [Tags]  regression
    Open Browser  https://www.google.com  chrome
    Close Browser

*** Keywords ***