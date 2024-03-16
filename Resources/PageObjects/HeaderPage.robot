*** Settings ***
Library  SeleniumLibrary
Variables  ../webelements.py

*** Variables ***
&{category}  Toys=220  Books=267    Art=550    Baby=2984    Electronics=293    Music=11233    VideoGames=1249 

*** Keywords ***
Choose category
    [Arguments]  ${arg1}
    Click Element    ${HomePage_category_dropdown}
    Click Element    xpath://option[@value=${category.${arg1}}]
Input Search Text and Click Search
    [Arguments]  ${arg1}
    Input Text    ${HomePage_search_textbox}  ${arg1}
    Press Keys  ${HomePage_search_button}  [RETURN]

Click on Advanced Search Link
    Click Element  ${HomePage_advanced_search_link}