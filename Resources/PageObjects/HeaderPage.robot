*** Settings ***
Library  SeleniumLibrary
Variables  ../webelements.py

*** Variables ***
# list Variables
# @{search_term}  robot  books  travel  mobile

# dictionary
&{search_term}  item1=Car  item2=Superman
&{category}  Toys=220  books=267

*** Keywords ***
Choose category
    Click Element    ${HomePage_category_dropdown}
    Click Element    xpath://option[@value=${category.Toys}]
Input Search Text and Click Search
    [Arguments]  ${arg1}
    Input Text    ${HomePage_search_textbox}  ${arg1}
    Press Keys  ${HomePage_search_button}  [RETURN]

Click on Advanced Search Link
    Click Element  ${HomePage_advanced_search_link}