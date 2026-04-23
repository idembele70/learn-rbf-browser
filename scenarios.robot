*** Settings ***
Library    Browser

*** Test Cases ***
TEST01
    Open Browser    url=https://www.google.com    browser=chromium    headless=False
    Sleep    1s

    # Pour s'entrainer imaginer des tests d'UI avec la browser library et d'API sur cette application
    # https://thinking-tester-contact-list.herokuapp.com/
    # 
    # exemple de tests : création de compte par l'interface, suppression par l'api, modification par l'api