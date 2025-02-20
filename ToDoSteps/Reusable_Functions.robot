*** Settings ***
Documentation    to do steps
Library    SeleniumLibrary
Resource    ../Test/Login.robot
Resource    ../Data/Common_Variables.robot

*** Variables ***

${USER_AGENT}    Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36
${Actual}    https://www.amazon.in/

*** Keywords ***


Launch browser

    Open Browser    ${URL}   ${browser}     options=add_experimental_option("detach", True)   options=add_argument("--proxy-server=http://your-proxy:port")  options=add_argument("user-agent=${USER_AGENT}")
    Maximize Browser Window

      
validate user is on home page
     Wait Until Element Is Visible    //a[@aria-label='Amazon.in']

user searches for "Apple watches"
    Input Text   //input[@role='searchbox']  Apple watches


user enters "username" and "password"
    Input Text    //input[@name='username']  ${username}
    Input Text    //input[@name='password']  ${password}
      
user click on login button
    Click Button    //button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
      
user closer the browser
    Close Browser