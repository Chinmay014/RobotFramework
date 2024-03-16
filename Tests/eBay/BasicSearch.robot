*** Settings ***
Documentation  Basic Search Functionality
Library  SeleniumLibrary

Resource  ../../Resources/CommonFunctionality.robot
Resource  ../../Resources/PageObjects/HeaderPage.robot
Resource  ../../Resources/PageObjects/SearchResultsPage.robot

Suite Setup  Start Testcase
Suite Teardown  Finish Testcase
Test Template  Product search

*** Variables ***
&{search_term}  item1=Car  item2=Superman


*** Test Cases ***    product    category
Product search1    car    Toys
Product search2    car    Art
Product search3    car    Books
Product search4    superman    Books
Product search5    superman    Music
Product search6    superman    VideoGames


*** Keywords ***

Product search
    [Arguments]  ${product}    ${category}
    [Documentation]  check categorical search for ${product}
    HeaderPage.Choose category    ${category}
    HeaderPage.Input Search Text and Click Search    ${product}
    SearchResultsPage.Verify Search Results    ${product}
