*** Settings ***
Documentation  Check sorting of results
Library    SeleniumLibrary

Resource    ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/PageObjects/HeaderPage.robot
Resource  ../../Resources/PageObjects/SearchResultsPage.robot

Suite Setup    Start Testcase
Suite Teardown    Finish Testcase
Test Template    Verify Ascending Sort

*** Variables ***

*** Test Cases ***    product
Verify Ascending Sort1    car
Verify Ascending Sort2    superman
Verify Ascending Sort3    bat
Verify Ascending Sort4    chicken

*** Keywords ***
Verify Ascending Sort
    [Arguments]    ${product}
    [Documentation]  sort from lowest to highest price
    CommonFunctionality.Start Testcase
    HeaderPage.Input Search Text and Click Search  ${product}
    SearchResultsPage.Sort search Results ascending
    ${price_list}=  SearchResultsPage.Get Price
    Verify List Sorted    ${price_list}
    CommonFunctionality.Finish Testcase