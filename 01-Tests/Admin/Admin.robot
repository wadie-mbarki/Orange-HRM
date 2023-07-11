**** Settings ***
Documentation    Ce script sert a implimenter OH-1

Library            SeleniumLibrary

Resource            ../../02-Scripts/Common/CommonFunctions.robot
Resource            ../../02-Scripts/Admin/AdminFonctionsPrincipales.robot

Test Setup    se logger dans orange 
Test Teardown    fermeture du test case  

*** Test Cases ***
ajouter un nouveau utilisateur 
    [Tags]    attente de numero sur jira
    Log To Console    premier cas de test
    Admin aller a la page Admin
    Log To Console    cliquer sur Add
    Admin lien pour ajouter un nouveau utilisateur
    Admin valider les elements ajout utilisateur
    Admin ajout nouveau utilisateur