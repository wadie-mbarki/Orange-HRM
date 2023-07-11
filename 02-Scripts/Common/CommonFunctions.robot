*** Settings ***
Documentation    documentation pour les libs coommons a tout les framework
Library          SeleniumLibrary
Library          String
Library          Collections
Variables        ../../03-Variables/Common/execution_settings.yaml 
Variables        ../../03-Variables/Common/AccesUnifieOrange.yaml
Variables        ../../03-Variables/Common/AccesDataInput.yaml  
*** Keywords ***
se logger dans orange
    [Documentation]    keyword pour se loguer
    Sleep    2
    Log To Console    ouverture du navigateur
    
    Sleep                            ${ExecutionSettings.TIMEOUT}
    Open Browser                     ${ExecutionSettings.orange_url}    ${ExecutionSettings.browser}
    Maximize Browser Window
    Sleep                            ${ExecutionSettings.TIMEOUT}
    #Delete All Cookies
    Log To Console    navigateur ouvert
    Set Log Level    None
    Wait Until Element Is Visible    ${AccesUnifieOrange.username.xpath}
    Click Element                    ${AccesUnifieOrange.username.xpath}
    Input Text                       ${AccesUnifieOrange.username.xpath}        ${AccesDataInput.username}
    
    
    Set Log Level    INFO
    Wait Until Element Is Visible    ${AccesUnifieOrange.password.xpath}
    Click Element                    ${AccesUnifieOrange.password.xpath}
    Input Text                       ${AccesUnifieOrange.password.xpath}        ${AccesDataInput.password}
    
    Log To Console    succes de saisi de username et password
    Set Log Level    INFO
    Wait Until Element Is Visible   ${AccesUnifieOrange.submit.xpath}
    Click Button                    ${AccesUnifieOrange.submit.xpath}
    Sleep                           ${ExecutionSettings.ATTENTE}
    Log To Console                  login avec succes
fermeture du test case
    Close All Browsers
Valider le contenu de un champ label
    [Arguments]                     ${locator}                                ${contenu_comparaison}
    ${contenu_champ}=               Get Text                                  ${locator} 
    Should Be Equal As Strings      ${contenu_champ}                          ${contenu_comparaison}

aller vers un lien 
    [Arguments]                          ${locators}
    Wait Until Element Is Visible        ${locators}
    Click Element                        ${locators}
    Sleep                                ${ExecutionSettings.ATTENTE}
