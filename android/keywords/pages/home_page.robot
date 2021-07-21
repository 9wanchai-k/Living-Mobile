*** Settings ***
Resource    ../../data/import.robot

*** Variables ***
${home_page.lbl_hello}        id=com.taipower.logindemo:id/txtHello
${home_page.check_to_home}    xpath=//android.widget.TextView[@text='Home']

*** Keywords ***
Check user login
    [Documentation]    Check user login
    [Arguments]    ${username}
    common.Wait loading
    ${get_user}    AppiumLibrary.Get Text    ${home_page.lbl_hello}
    Should be equal    Hello${space}${username}    ${get_user}

Check go to home page
    [Documentation]    login success check go to home page
    Wait Until Element Is Visible    ${home_page.check_to_home}