*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Process
Test Setup    Set Selenium Speed    0.4
Resource    ../ToDoSteps/Reusable_Functions.robot

*** Variables ***

${RESOURCE_DIR}     ./Resource

*** Test Cases ***


Split files and send to resource folder

    [Tags]    Demo_1

    Run Split Script



Run Upload Workflow Once

      [Tags]    Demo_2

      Launch browser

      Validate User Is On Home Page

      Get Excel Files From Resource and upload

      Submit the request

      Close The Browser


Repeat Upload Workflow 10 Times

    [Tags]    Demo_3

      Launch browser

      Validate User Is On Home Page

      Run upload workflow 10 times

      Submit the request

      Close The Browser




























Validate user is able to login to application

      [Tags]    Demo3

      Launch browser

      Validate User Is On Home Page

      Select File And Submit

      #Close The Browser