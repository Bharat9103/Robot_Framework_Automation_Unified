*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/WebKeywords/AD_Warehouse_Keys.robot
Variables    ../../PageObjects/WebLocators/AD_Warehouse.py

*** Test Cases ***

TC3068 - Verify user is able to access the add warehouse page
    [Setup]    Setup For Add Warehouse Page
    Then Verify user is redirected to add warehouse page

TC3070 - Verify Warehouse name is a mandatory field
    [Setup]    Setup For Add Warehouse Page
    When Admin clicks on submit button
    Then Verify a pop prompt is visible that does not allow the admin to submit without a name

TC3071 - Verify warehouse name is a alpha numeric field.
    [Setup]    Setup For Add Warehouse Page
    When Admin enters alphanumeric text in warehouse field
    When Admin clicks on submit button
    Then Verify alert pop up for warehouse field should not be visible

TC3072 - Verify state is a mandatory field.
    [Setup]    Setup For Add Warehouse Page
    When Admin enters alphanumeric text in warehouse field
    When Admin clicks on submit button
    Then Verify a pop prompt "Please Select State," prevents user from submiting.

TC3073 - Verify user is able to access the state drop down and pick a state.
    [Setup]    Setup For Add Warehouse Page
    When Admin enters alphanumeric text in warehouse field
    Then Verify admin is able to select state from the dropdown

TC3074 - Verify city is a mandatory field.
    [Setup]    Setup For Add Warehouse Page
    When Admin enters alphanumeric text in warehouse field
    Then Verify admin is able to select state from the dropdown
    When Admin clicks on submit button
    Then Verify a pop prompt "Please Select city," prevents user from submiting.

TC3075 - Verify user can access the city drop down and pick a city.
    [Setup]    Setup For Add Warehouse Page
    Then Verify admin is able to select state from the dropdown
    Then Verify admin is able to pick the desired city

TC3076 - Verify "Jurisdiction" in the Tax details section is a mandatory field.
    [Setup]    Setup For Add Warehouse Page
    When Admin enters alphanumeric text in warehouse field
    Then Verify admin is able to select state from the dropdown
    Then Verify admin is able to pick the desired city
    When Admin clicks on submit button
    Then Verify a pop prompt "Please provide Jurisdiction, under Tax Details prevents user from submiting.

TC3077 - Verify user can sucessfully create a new warehouse by providing, the mandatory fields.
    [Setup]    Setup For Add Warehouse Page
    When Admin enters alphanumeric text in warehouse field
    Then Verify admin is able to select state from the dropdown
    Then Verify admin is able to pick the desired city
    When Admin enters Jurisdiction detail
    When Admin clicks on submit button
    Then Verify success msg is displayed

TC3078 - Verify user can access edit warehouse page.
    [Setup]    Setup For Add Warehouse Page
    When Admin enters alphanumeric text in warehouse field
    Then Verify admin is able to select state from the dropdown
    Then Verify admin is able to pick the desired city
    When Admin enters Jurisdiction detail
    When Admin clicks on submit button
    Then Verify success msg is displayed
    When Admin goes to warehouses page
    When Admin searches newly created warehouse
    Then Admin clicks on edit button and is redirected to edit page of selected warehouse

