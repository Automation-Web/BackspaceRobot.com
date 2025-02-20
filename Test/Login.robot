*** Settings ***
Library    SeleniumLibrary
Resource    ../ToDoSteps/Reusable_Functions.robot



*** Test Cases ***
Validate user is able to login to application

      Launch browser

      validate user is on home page

      user searches for "Apple watches"

#      user enters "username" and "password"
#
#      user click on login button
#
#      user closer the browser



