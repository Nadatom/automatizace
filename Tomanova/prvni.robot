*** Settings ***
Library     Browser

*** Test Cases ***
Starting a browser with a page
    # Vypne headless mód
    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page       https://www.rohlik.cz/
    # Otevře web a zkontroluje Title (jestli je opravdu jeji bázev Browser)
    Get Title      ==    Online supermarket Rohlik.cz — nejrychlejší doručení ve městě

