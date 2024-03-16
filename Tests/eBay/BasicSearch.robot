*** Settings ***
Documentation  Basic Search Functionality
Library  SeleniumLibrary
Library  DataDriver  ../../TestData/testDataforBasicSearch.csv

Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/PageObjects/HeaderPage.robot
Resource  ../../Resources/PageObjects/SearchResultsPage.robot


Suite Setup  Start Testcase
Suite Teardown  Finish Testcase
Test Template  Product search

*** Variables ***
&{search_term}  item1=Car  item2=Superman


*** Test Cases ***
Product search1    ${product}    ${category}

*** Keywords ***

Product search
    [Arguments]  ${product}    ${category}
    [Documentation]  check categorical search for ${product}
    HeaderPage.Choose category    ${category}
    HeaderPage.Input Search Text and Click Search    ${product}
    SearchResultsPage.Verify Search Results    ${product}
