*** Settings ***
Resource    ${CURDIR}../../ios/data/import.robot
Suite Setup    Set appium timeout    30
*** Test Cases ***
Login email invalid
    [Tags]    test_01
    common.Open app from installed app
    login_page.Input username        ${email_invalid['user']}
    login_page.Input password        ${email_invalid['pass']}
    login_page.Tap login
    login_page.Check alert popup     ${email_invalid['error_message']}
    login_page.Tap ok on popup error message
    Quit application

Login pass short
    [Tags]    test_02
    common.Open app from installed app
    login_page.Input username        ${pass_short['user']}
    login_page.Input password        ${pass_short['pass']}
    login_page.Tap login
    login_page.Check alert popup     ${pass_short['error_message']}
    login_page.Tap ok on popup error message
    Quit application

Login pass invalid
    [Tags]    test_03
    common.Open app from installed app
    login_page.Input username        ${pass_invalid['user']}
    login_page.Input password        ${pass_invalid['pass']}
    login_page.Tap login
    login_page.Check alert popup     ${pass_invalid['error_message']}
    login_page.Tap ok on popup error message
    Quit application

Login success
    [Tags]    test_04
    common.Open app from installed app
    login_page.Input username            ${login_success['user']}
    login_page.Input password            ${login_success['pass']}
    login_page.Tap login
    home_page.Check go to home page
    home_page.Check user login           ${login_success['user']}
    Quit application