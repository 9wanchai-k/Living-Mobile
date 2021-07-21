*** Settings ***
Resource    ../../data/import.robot

*** Variables ***
${common.loading}        id=com.taipower.logindemo:id/login_progress

*** Keywords ***
Open app from installed app
    [Documentation]  Open application from installed app
    Open Application    remote_url=http://localhost:1111/wd/hub
    ...    deviceName=Test
    ...    platformVersion=11.0
    ...    platformName=Android
    ...    appPackage=com.taipower.logindemo
    ...    appActivity=com.taipower.logindemo.LoginActivity
    ...    app=/Users/reb4ck/appAndroid.apk
    ...    noReset=false
    ...    newCommandTimeout=6000
    ...    autoGrantPermissions=true
    ...    unicodeKeyboard=true
    ...    resetKeyboard=true

Input Text To Element When Ready
    [Documentation]  Input Text To Element
    [Arguments]     ${locator_element}   ${text_to_input}
    common.Wait loading
    AppiumLibrary.Wait Until Element Is Visible        ${locator_element}
    AppiumLibrary.Input Text     ${locator_element}    ${text_to_input}

Tap Element When Ready
    [Documentation]  Tap Element When Ready
    [Arguments]    ${locator_element}
    common.Wait loading
    AppiumLibrary.Wait Until Element Is Visible        ${locator_element}
    AppiumLibrary.Click Element                        ${locator_element}

Clear Text To Element When Ready
    [Documentation]  Clear Text To Element When Ready
    [Arguments]    ${locator_element}
    common.Wait loading
    AppiumLibrary.Wait Until Element Is Visible        ${locator_element}
    AppiumLibrary.Clear Text                           ${locator_element}

Wait loading
    [Documentation]    Wait loading
    AppiumLibrary.Wait Until Page Does Not Contain    ${common.loading}
 