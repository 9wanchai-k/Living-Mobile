*** Settings ***
Resource    ../../data/import.robot

*** Variables ***
${login_page.email_txt}               chain=**/XCUIElementTypeTextField[`name == "email_field"`]
${login_page.password_txt}            chain=**/XCUIElementTypeSecureTextField[`name == "password_field"`]
${login_page.btn_login}               chain=**/XCUIElementTypeStaticText[`label == "LOGIN"`]
${login_page.popup_message}           chain=**/XCUIElementTypeStaticText[`label == "error_message"`]
${login_page.btn_ok_on_popup}         chain=**/XCUIElementTypeButton[`label == "OK"`]
${login_page.popup__alert_message}    chain=**/XCUIElementTypeStaticText[`label == "Alert"`]

*** Keywords ***
Clear text on username
    [Documentation]    Clear Text On element username
    common.Clear Text To Element When Ready    ${login_page.email_txt}

Clear text on password
    [Documentation]    Clear Text On element password
    common.Clear Text To Element When Ready    ${login_page.password_txt}

Input username
    [Documentation]    input Text On element username
    [Arguments]    ${username}
    common.Input Text To Element When Ready    ${login_page.email_txt}       ${username}

Input password
    [Documentation]    input Text On element password
    [Arguments]    ${password}
    common.Input Text To Element When Ready    ${login_page.password_txt}    ${password}

Tap login
    [Documentation]    Tap to button login
    common.Tap Element When Ready    ${login_page.btn_login}

Check alert popup
    [Documentation]    check alert popup message
    [Arguments]    ${error_message}
    common.Wait loading
    Wait Until Element Is Visible    ${login_page.popup__alert_message}
    ${check_message}    Replace String    ${login_page.popup_message}    error_message    ${error_message}
    Wait Until Element Is Visible    ${check_message}

Tap ok on popup error message
    [Documentation]    Tap ok on popup error message
    common.Tap Element When Ready    ${login_page.btn_ok_on_popup}
