*** Settings ***
Library     OperatingSystem
*** Test Cases ***
Prvni test pozitivni
    ${res} =        run     md
    log             ${res}
    Should Contain  ${res}  The syntax of the command is incorrect.
Druhy test pozitivni
    ${pos} =        run     ver
    log           ${pos}
    Should Contain  ${pos}  Microsoft Windows [Version 10.0.19042.1237]
 
Prvni test negativni
    ${neg} =        run     rd
    log             ${neg}
    Should Contain  ${neg}  The syntax of the command is incorrectní.
Druhy test negativni
    ${nezd} =       run     dir
    log             ${nezd}
    Should Contain  ${neg}  Vypise vsechny adresare a soubory.
