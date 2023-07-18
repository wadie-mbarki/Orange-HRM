**** Settings ***
Documentation    Ce script sert a implimenter OHJ-7

Library            SeleniumLibrary

Resource            ../../02-Scripts/Common/CommonFunctions.robot
Resource            ../../02-Scripts/Admin/AdminFonctionsPrincipales.robot

Test Setup    se logger dans orange 
Test Teardown    se deconnecter

*** Test Cases ***
ajouter un nouveau utilisateur 
    [Tags]        OHJ-7
    Log To Console    Executing OHJ-7
    Admin aller a la page Admin
    Log To Console    cliquer sur Add
    Admin lien pour ajouter un nouveau utilisateur
    Admin valider les elements ajout utilisateur
    Admin ajout nouveau utilisateur
    