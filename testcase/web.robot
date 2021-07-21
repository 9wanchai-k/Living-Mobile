*** Settings ***
Resource    ${CURDIR}../../web/data/import.robot
Suite setup     Run keyword
...             Set Selenium Speed    0.5
Suite Teardown  Close Browser
*** Test Cases ***
Register
    [Documentation]    Register with epoch
    common.Open Website 
    home_page.Click Sign Up
    register_page.Input email with epoch    ${Register['email']}
    register_page.Click Submit
    register_page.Input user name           ${Register['username']}
    register_page.Input password            ${Register['password']}
    register_page.Click Submit Register Step 2
    setup_page.Check go to page setup
    setup_page.Select Theme                 ${Register['setup_theme']}
    setup_page.Click Open my Todoist
    todo_page.Check go to todo page
    Close Browser

Login
    [Documentation]    Login
    ...                Add task
    ...                Edit task
    ...                Delete task
    common.Open Website 
    home_page.Click Login
    login_page.Input mail                             ${replaced_username}
    login_page.Input Password                         ${Register['password']}
    login_page.Click Login
    todo_page.Check go to todo page
    todo_page.Click add todo list
    todo_page.Input in task                           ${Add_Task['add_text']}
    todo_page.Click Edit task
    todo_page.Input Edit text in task                 ${Add_Task['edit_test']}
    todo_page.Click more options
    todo_page.Click Delect on option more
    todo_page.Click Confirm Delete
    Close Browser

Login and Sort Task
    common.Open Website 
    home_page.Click Login
    login_page.Input mail                            ${replaced_username}
    login_page.Input Password                        ${Register['password']}
    login_page.Click Login
    todo_page.Check go to todo page
    todo_page.Input ${Sort['sequence']} text in task and random string
    Click Sort data
    Select Sort option                              ${Sort['sort_by']}



