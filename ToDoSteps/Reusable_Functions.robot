*** Settings ***
Documentation    to do steps
Library    SeleniumLibrary
Resource    ../Data/Common_Variables.robot
Library    OperatingSystem
Library    Process
Library    ../ToDoSteps/SplitAndMoveFiles.py
Library    SplitAndMoveFiles.py
#Library    Browser
#Library    Playwright.py

*** Variables ***
${RESOURCE_DIR}     E:/MyWork/robotFramework/Test/Resource
#${RESOURCE_DIR}     ../Resource
#${RESOURCE_DIR}    ${CURDIR}/Resource
${USER_AGENT}    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36
${Actual}    https://www.amazon.in/

*** Keywords ***

#Launch browser
#    New Browser    chromium    headless=${FALSE}    args=["--start-maximized"]
#    New Context    no_viewport=${TRUE}    record_video={'dir': 'videos/'}
#    New Page    https://example.com
#    Sleep    3s
#     Run Process    Python   Playwright.py
#      run_playwright_script



#Launch browser
#    Log To Console    🛠️🚀 Launching Selenium Session... Let's automate! 🤖✨
#    Open Browser    ${URL}   ${browser}   options=add_experimental_option("detach", True)   options=add_argument("--proxy-server=http://your-proxy:port")  options=add_argument("user-agent=${USER_AGENT}")
#    Maximize Browser Window

Launch browser
    Log To Console    🛠️🚀 Launching Selenium Session... Let's automate! 🤖✨
    Open Browser    ${URL}   ${Headless}  ${browser}
    Maximize Browser Window


Headless Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --window-size=1920x1080
    Return From Keyword    ${options}
      
validate user is on home page
    Wait Until Element Is Visible    //a[@aria-label='SUT']
     Title Should Be    Files Upload page for Automation Testing Practice


user searches for "Apple watches"
    Input Text   //input[@role='searchbox']  Apple watches


user enters "username" and "password"
    Input Text    //input[@name='username']  ${username}
    Input Text    //input[@name='password']  ${password}
      
user click on login button
    Click Button    //button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
      
Close the browser
    Close Browser

Upload file from resource folder
    Wait Until Element Is Visible    //h3[text()='File Uploader']
    Choose File    (//input[@type='file'])[1]

Submit the request
    Click Element    //input[@value='Upload']

Run Split Script
    Split And Move Files
    #Run Process    Python    ToDoSteps/SplitAndMoveFiles.py

#Get Excel Files From Resource and upload
#    @{files}=    List Files In Directory    ${RESOURCE_DIR}    *.xlsx
#    Log    ${RESOURCE_DIR}
#    [Return]     ${files}
#    Log    ${files}
#    # Fill required fields here
#    Choose File    (//input[@type='file'])    ${files}
#    Click Element    //button[contains(text(),'Upload')]
#    Wait Until Element Is Visible    //h1[text()='File Uploaded!']
#    Remove File    ${files}

Get Excel Files From Resource and upload

    @{files}=    List Files In Directory    ${RESOURCE_DIR}    *.xlsx
    Log    ${files}

    FOR    ${file}    IN    @{files}
        ${file_path}=   Normalize Path     ${RESOURCE_DIR}/${file}
        ${abs_path}=    Set Variable        E:\\MyWork\\robotFramework\\Test\\${file_path}
        Log    ${file_path}
        Log    Uploading: ${abs_path}
        Upload Excel File    ${abs_path}
    END

Upload Excel File
    [Arguments]    ${file}
    Choose File    //input[@type='file']    ${file}
    Wait Until Element Is Visible    //button[contains(text(),'Upload')]
    Click Element    //button[contains(text(),'Upload')]
    Wait Until Element Is Visible    //h1[text()='File Uploaded!']
    Remove File    ${file}


Select File and submit
    Choose File    //input[@type='file']     E:/MyWork/robotFramework/Test/Resource/TestData_File_1.xlsx
    Click Element    //button[contains(text(),'Upload')]
    Wait Until Element Is Visible    //h1[text()='File Uploaded!']

Run Upload Workflow Once
      Launch browser

      Validate User Is On Home Page

      Run Split Script

      Get Excel Files From Resource and upload

      #Upload Excel File

      Submit the request

      Close The Browser

Run upload workflow 10 times

    FOR    ${i}    IN RANGE    10
        ${iteration}=    Evaluate    ${i} + 1
        Log    === Iteration ${iteration} ===
        Get Excel Files From Resource and upload
    END