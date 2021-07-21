*** Settings ***
Resource    ../../data/import.robot

*** Variables ***
${home_page.lbl_hello}        xpath=//XCUIElementTypeStaticText[@name="hello_label"]
${home_page.check_to_home}    chain=**/XCUIElementTypeStaticText[`label == "Home"`]

*** Keywords ***
Check user login
    [Documentation]    Check user login
    [Arguments]    ${username}
    common.Wait loading
    ${get_user}    AppiumLibrary.Get Element Attribute    ${home_page.lbl_hello}    label
    Should be equal    Hello${space}${username}    ${get_user}

Check go to home page
    [Documentation]    login success check go to home page
    Wait Until Element Is Visible    ${home_page.check_to_home}