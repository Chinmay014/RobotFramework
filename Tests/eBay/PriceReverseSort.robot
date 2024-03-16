*** Settings ***
Documentation  Check sorting of results
Library    SeleniumLibrary

Resource    ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/PageObjects/HeaderPage.robot
Resource  ../../Resources/PageObjects/SearchResultsPage.robot

Suite Setup    Start Testcase
Suite Teardown    Finish Testcase
Test Template    Verify Descending Sort

*** Variables ***

*** Test Cases ***    product
Verify Descending Sort1    car
Verify Descending Sort2    superman
Verify Descending Sort3    bat
Verify Descending Sort4    chicken

*** Keywords ***
Verify Descending Sort
    [Arguments]    ${product}
    [Documentation]  sort from lowest to highest price
    CommonFunctionality.Start Testcase 
    HeaderPage.Input Search Text and Click Search  ${product}
    SearchResultsPage.Sort search Results descending
    ${price_list}=  SearchResultsPage.Get Price
    Verify List Sorted    ${price_list}
    CommonFunctionality.Finish Testcase