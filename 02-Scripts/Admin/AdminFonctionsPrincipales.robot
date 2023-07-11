*** Settings ***
Library              SeleniumLibrary
Library              Collections
Library              OperatingSystem
Library              DateTime
Library              yaml

Variables            ../../03-Variables/Admin/UserManager/USerManagerLocalisateur.yaml
Variables            ../../03-Variables/Admin/UserManager/USerManagerListe.yaml 
Variables            ../../03-Variables/Common/OrangeHomePage.yaml
Resource             ../../02-Scripts/Common/CommonFunctions.robot
     
*** Keywords ***
Admin valider les elements ajout utilisateur
    [Documentation]    ce keyword verifie les elements sur la page d'ajout un nouveau utilisateur
    Valider le contenu de un champ label                ${USerManager.SystemUsers.Add_titre_Champ.txt_user_role.xpath}                               ${USerManager.SystemUsers.Add_titre_Champ.txt_user_role.descriptiom}
    Valider le contenu de un champ label                ${USerManager.SystemUsers.Add_titre_Champ.txt_employee_name.xpath}                           ${USerManager.SystemUsers.Add_titre_Champ.txt_employee_name.descriptiom}
    Valider le contenu de un champ label                ${USerManager.SystemUsers.Add_titre_Champ.txt_status.xpath}                                  ${USerManager.SystemUsers.Add_titre_Champ.txt_status.descriptiom}
    Valider le contenu de un champ label                ${USerManager.SystemUsers.Add_titre_Champ.txt_username.xpath}                                ${USerManager.SystemUsers.Add_titre_Champ.txt_username.descriptiom}
    Valider le contenu de un champ label                ${USerManager.SystemUsers.Add_titre_Champ.txt_password.xpath}                                ${USerManager.SystemUsers.Add_titre_Champ.txt_password.descriptiom}
    Valider le contenu de un champ label                ${USerManager.SystemUsers.Add_titre_Champ.txt_confirmpassword.xpath}                         ${USerManager.SystemUsers.Add_titre_Champ.txt_confirmpassword.descriptiom} 
Admin aller a la page Admin
    [Documentation]    ce keyword permet de se deplacer vers la page Admin
    aller vers un lien                                  ${OrangeHomePage.link_Admin.xpath}

Admin lien pour ajouter un nouveau utilisateur
    [Documentation]    ce keyword permet de cliquer sur le bouton "+ Add" pour afficher la page d'ajout d'un nouveau utilisateur
    Wait Until Element Is Visible             ${USerManager.SystemUsers.Add_Champ.btn_add.xpath}
    Click Button                              ${USerManager.SystemUsers.Add_Champ.btn_add.xpath}
    Sleep                                     ${ExecutionSettings.ATTENTE}
Admin ajout nouveau utilisateur
    [Documentation]    ce keyword a pour but d'ajouter un nouveau utilisateur
    
    Click Element                ${USerManager.SystemUsers.Add_Champ.list_user_role.xpath}  
    Wait Until Element Is Visible    xpath= //div[@role='listbox']                
    Select From List By Value    xpath= //div[@role='listbox']    Admin
    Sleep    3
    Input Text                   ${USerManager.SystemUsers.Add_Champ.lbl_employee_name.xpath}                ${USerManagerListe.Utilisateur1.employeeName}
    #Select From List By Value    ${USerManager.SystemUsers.Add_Champ.list_status.xpath}                      ${USerManagerListe.Utilisateur1.staus}
    Input Text                   ${USerManager.SystemUsers.Add_Champ.lbl_username.xpath}                     ${USerManagerListe.Utilisateur1.Username}
    Input Password               ${USerManager.SystemUsers.Add_Champ.lbl_password.xpath}                     ${USerManagerListe.Utilisateur1.password}
    Input Password               ${USerManager.SystemUsers.Add_Champ.lbl_confirm_password.xpath}             ${USerManagerListe.Utilisateur1.password}
    Sleep                        ${ExecutionSettings.TIMEOUT} 
    Click Button                 ${USerManager.SystemUsers.Add_titre_Champ.btn_save.xpath} 
    #je dois ajouter apres la confirmation de la creation      