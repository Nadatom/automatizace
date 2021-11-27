*** Settings ***
Library     Browser
#propojeni na soubor s promennymi
Resource    test_data.robot

Test Setup  New Browser         ${browser}                    headless=false

*** Test Cases ***

#prihlaseni a vybrani napoje
Prihlaseni a napoj
    Login               ${pemail}                         ${pheslo}        JT
    #klikne na napoje - hlavni nabidka
    Click               xpath=//*[@id="sortiment"]/ul/li[8]/a/span
    #limonady a energy
    Click               xpath=//*[@id="pageFullWidth"]/main/div[2]/div[2]/ul/li[3]/a/span
    #timeout nezle pouzit - robot vybere jinou vec, nez je treba
    Sleep               3
    #kolove napoje
    Click               xpath=//*[@id="pageFullWidth"]/main/div[2]/div[2]/ul/li[1]/a/span
    #timeout nezle pouzit - robot vybere jinou vec, nez je treba
    Sleep               3
    #Klik na doporucenou 1 lahev (cola)
    Click               xpath=//*[@id="pageFullWidth"]/main/div[2]/div[3]/div/div/div/div/div[1]/article/a/div/div[2]/img
    Sleep               3
    #ve zvetsenem okne klikne na "do kosiku"
    Click               xpath=//*[@id="productDetail"]/div[1]/div[3]/div[3]/div/div/button
    #zavre vybrane okno "X"
    Click               xpath=//*[@id="modalOverlay"]/div/div/div[2]/div
    Sleep               3
    #odebere napoj z kosiku "-"
    Click               xpath=//*[@id="product_1351609"]/div[2]/div/button[1]
    [Teardown]          Logout
    Sleep               3



*** Keywords ***

Login
    [Arguments]         ${pemail}                   ${pheslo}                   ${pnastane}
    ${timeout}          Set Browser Timeout         20

    log                 ${pemail}
    log                 ${pheslo}
    log                 ${pnastane}

    #New Browser je nepovinne, ale pak vidime/nevidime otevreny prohlizec
    #New Browser         ${browser}                    headless=false

    New Page            ${URL}
    Get Title           contains                    ${SEL_title_rohlik}
    Click               id=headerLogin

    Type Text           id=email                    ${pemail}

    Type Text           id=password                 ${pheslo}

    Click               data-test=btnSignIn

Logout
    #Kliknutim na inicialy, vyvolame odhlasovaci okno
    Click                xpath=//*[@id="headerUser"]/div
    #Klik na odhlasovaci tlacitko
    Click                 data-test=user-box-logout-button