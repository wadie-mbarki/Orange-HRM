**** Settings ***
Documentation    Ce script sert a implimenter OHJ-8

Library            SeleniumLibrary

Resource            ../../02-Scripts/Common/CommonFunctions.robot
Resource            ../../02-Scripts/Admin/AdminFonctionsPrincipales.robot

Test Setup    se logger dans orange 
Test Teardown    se deconnecter

*** Test Cases ***
modifier un utilisateur 
    [Tags]        OHJ-8
    Log To Console    Executing OHJ-8
    Admin aller a la page Admin
    Log To Console    cliquer sur search 
    Admin chercher un utilisateur
    Admin selectionner user a modifier