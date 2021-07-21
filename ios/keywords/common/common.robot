*** Settings ***
Resource    ../../data/import.robot

*** Variables ***
${common.loading}        id=com.taipower.logindemo:id/login_progress
${common.popup}          chain=**/XCUIElementTypeButton[`label == "Ask App Not to Track"`]
${common.noti}           chain=**/XCUIElementTypeButton[`label == "Don’t Allow"`]

*** Keywords ***
Open app from installed app
    [Documentation]  Open tops application on Local iOS Device
    Open application            remote_url=http://localhost:1111/wd/hub
    ...                         automationName=Test
    ...                         platformName=iOS
    ...                         platformVersion=11.0
    ...                         deviceName=test
    ...                         udid=B3382C9C-7E2C-4B57-9695-16552F39080D
    ...                         app=/Users/reb4ck/appIOS.app
    ...                         fullReset=false
    ...                         wdaLocalPort=8120
    ...                         usePrebuiltWDA=true
    ...                         useJSONSource=true
    ...                         simpleIsVisibleCheck=true
    ...                         waitForQuiescence=false
    ...                         newCommandTimeout=36000
    ...                         launchTimeout=48000
    ...                         reduceMotion=true
    ...                         automationName=XCUITest
    ...                         noReset=False
    ...                         autoAcceptAlerts=False
#     common.Skip system pop-up

# Skip system pop-up
#     [Documentation]    Skip system pop-up
#     Run Keyword And Ignore Error    Tap Element When Ready    ${common.popup}
#     Run Keyword And Ignore Error    Tap Element When Ready    ${common.noti}
    
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