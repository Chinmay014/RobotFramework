*** Settings ***
Library  SeleniumLibrary
Library    ../../.venv/lib/site-packages/robot/libraries/Collections.py
Library    ../../.venv/lib/site-packages/robot/libraries/String.py
Resource  ./HeaderPage.robot


*** Variables ***


*** Keywords ***
Verify Search Results
    [Arguments]  ${arg1}
    Set Selenium Implicit Wait    5s
    Page Should Contain    results for ${arg1}

Sort search Results ascending
    Click Element    ${SearchResultPage_sortCategory_dropdown}
    Click Element    ${SearchResultPage_sortCategory_lowToHigh}

Sort search Results descending
    Click Element    ${SearchResultPage_sortCategory_dropdown}
    Click Element    ${SearchResultPage_sortCategory_highToLow}

Get Price
    @{AllPrices}=    Create List  
    ${list elements}=    Get WebElements    //span[@class='s-item__price']
    ${list_length}=  Get Length    ${list elements}
    FOR    ${i}    IN RANGE  1  ${list_length}
        ${element}=  Get From List  ${list elements}  ${i}
        ${price_text}=    Get Text    ${element}
        Append To List    ${AllPrices}  ${price_text}
    END
    [Return]    ${AllPrices}
    
Extract Numerical Value
    [Arguments]    ${input_string}
    ${matches}=  Get Regexp Matches  ${input_string}    \\d+\\.\\d+
    ${numerical_value}=    Convert To Number    ${matches[0]}
    [Return]    ${numerical_value}

Verify List Sorted
    [Arguments]  ${list1}
    ${first_element}=  Get From List    ${list1}    0
    ${second_element}=  Get From List    ${list1}    1
    ${third_element}=  Get From List    ${list1}    2
    ${first_number}=  Extract Numerical Value    ${first_element}
    ${second_number}=  Extract Numerical Value    ${second_element}
    ${third_number}=  Extract Numerical Value    ${third_element}
    Run Keyword Unless    ${first_number} <= ${second_number}    Fail    Condition not met
    Run Keyword Unless    ${second_number} <= ${third_number}    Fail    Condition not met
    Log    Pass