*** Settings ***
Documentation  Basic Search Functionality
Library  SeleniumLibrary

Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/PageObjects/HeaderPage.robot
Resource  ../../Resources/PageObjects/SearchResultsPage.robot

Test Setup  Start Testcase
Test Teardown  Finish Testcase

*** Variables ***

*** Test Cases ***
Verify basic search
    [Documentation]  check if a categorical search is done
    [Tags]  Functional
    
    HeaderPage.Choose category
    HeaderPage.Input Search Text and Click Search  car
    SearchResultsPage.Verify Search Results  car

Verify results sort
    [Documentation]  check if the results are sorted
    [Tags]  Functional

    HeaderPage.Input Search Text and Click Search  car
    SearchResultsPage.Sort search Results ascending

Verify Price sort
    [Documentation]  sort from lowest to highest price 
    HeaderPage.Input Search Text and Click Search  superman
    SearchResultsPage.Sort search Results ascending
    ${price_list}=  SearchResultsPage.Get Price
    Verify List Sorted    ${price_list}

Verify Price sort reverse
    [Documentation]  sort from highest to lowest price
    HeaderPage.Input Search Text and Click Search  superman
    SearchResultsPage.Sort search Results descending
    ${price_list}=  SearchResultsPage.Get Price
    Verify List Sorted    ${price_list}

Verify Advanced Search
    [Documentation]  verify if advanced search link works
    HeaderPage.Click on Advanced Search Link
