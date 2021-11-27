*** Settings ***
Library     Browser

*** Test Cases ***
Starting a browser with a page
    New Browser     chromium    headless=false
    New Page        https:\\www.rohlik.cz/
    Get Title       contains    Rohlik.cz
    # 4 způsoby, jak prokliknout
    Click           data-test=header-user-icon
    Click           id=headerLogin
    Click           css=#headerLogin
    Click           text="Přihlásit"
    Sleep           3