*** Settings ***
Library     OperatingSystem


*** Test Cases ***


Prvni test pozitivni, passne
    ${res} =        run     md
    log             ${res}
    Should Contain  ${res}  The syntax of the command is incorrect.

#tento test passne, pokud bude v PC stejna verze WIN
Druhy test pozitivni
    ${pos} =        run     ver
    log           ${pos}
    Should Contain  ${pos}  Microsoft Windows [Version 10.0.19042.1586]

#tento te failne, protoze neexistuje slovo "incorrectní"
Prvni test negativni
    ${neg} =        run     rd
    log             ${neg}
    Should Contain  ${neg}  The syntax of the command is incorrectní.

#tento test failne, protoze jsou spatne pouzite promenne
Druhy test negativni
    ${nezd} =       run     dir
    log             ${nezd}
    Should Contain  ${neg}  Vypise vsechny adresare a soubory.
