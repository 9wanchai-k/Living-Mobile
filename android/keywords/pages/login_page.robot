*** Settings ***
Resource    ../../data/import.robot

*** Variables ***
${login_page.email_txt}           id=com.taipower.logindemo:id/email
${login_page.password_txt}        id=com.taipower.logindemo:id/password
${login_page.btn_login}           id=com.taipower.logindemo:id/email_sign_in_button
${login_page.popup_message}       id=android:id/message
${login_page.btn_ok_on_popup}     id=android:id/button1

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
    Wait Until Element Is Visible    ${login_page.popup_message}
    ${get_message}    AppiumLibrary.Get Text    ${login_page.popup_message}
    Should be equal    ${error_message}    ${get_message}

Tap ok on popup error message
    [Documentation]    Tap ok on popup error message
    common.Tap Element When Ready    ${login_page.btn_ok_on_popup}
