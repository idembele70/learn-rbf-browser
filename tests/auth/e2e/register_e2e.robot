*** Settings ***
Library             Browser

Test Setup          Open Register Page
Test Teardown       Close Register Page

Test Tags           register


*** Variables ***
${BASE_URL}                 https://thinking-tester-contact-list.herokuapp.com/
${REGISTER_PATHNAME}        addUser
${CONTACT_LIST_PATHNAME}    contactList
${LOGIN_PATHNAME}           login
${BROWSER}                  chromium
${HEADLESS}                 False


*** Test Cases ***
Successful Registration With All Valid Data
    [Documentation]    ...
    [Tags]    happy    smoke
    Given I Am On The Register Page
    When I Enter "John" In The "First Name" Field
    When I Enter "Doe" In The "Last Name" Field
    And I Enter "john.doe@invalid.invalid" In The "Email" Field
    And I Enter "P@ssword123" In The "Password" Field
    And I Click "Submit"
    Then I Am Redirected To The Contact Page

Registration With A Hyphenated First Name
    [Documentation]    ...
    [Tags]    happy
    Given I Am On The Register Page
    When I Enter "Marie-Claire" In The "First Name" Field
    And I Enter "Martin" In The "Last Name" Field
    And I Enter "marie-claire.martin@example.com" In The "Email" Field
    And I Enter "SecurePass1!" In The "Password" Field
    And I Click "Submit"
    I Am Redirected To The Contact Page

Registration With An Uppercase Email
    [Documentation]    ...
    [Tags]    happy
    Given I Am On The Register Page
    When I Enter "Jane" In The "First Name" Field
    And I Enter "Smith" In The "Last Name" Field
    And I Enter "JANE.SMITH@INVALID.INVALID" In The "Email" Field
    And I Enter "ValidPass99!" In The "Password" Field
    And I Click "Submit"
    Then I Am Redirected To The Contact Page

Registration With A Password At Minimum Accepted Length
    [Documentation]    ...
    [Tags]    happy
    Given I Am On The Register Page
    When I Enter "Alice" In The "First Name" Field
    And I Enter "Dupont" In The "Last Name" Field
    And I Enter "alice.dupont@invalid.invalid" In The "Email" Field
    And I Enter "Abcd1234" In The "Password" Field
    And I Click "Submit"
    Then I Am Redirected To The Contact Page

Cancel Button Redirecteds To The Login Page
    [Documentation]    ...
    [Tags]    happy
    Given I Am On The Register Page
    When I Click "Cancel"
    Then I Am Redirected To The Login Page


*** Keywords ***
Open Register Page
    [Documentation]    ...
    Open Browser    url=${BASE_URL}${REGISTER_PATHNAME}    browser=${BROWSER}    headless=${HEADLESS}

Close Register Page
    [Documentation]    ...
    Close Browser    CURRENT

I Am On The Register Page
    [Documentation]    ...
    ${add_user_heading} =    Get Element By Role    HEADING    name=Add User
    Get Element States    ${add_user_heading}    contains    visible

I Enter "${text}" In The "${field_name}" Field
    [Documentation]    ...
    ${field} =    Get Element By    Placeholder    text=${field_name}    exact=True
    Fill Text    selector=${field}    txt=${text}

I Click "${label}"
    [Documentation]    ...
    ${locator} =    Get Element By    Text    text=${label}
    Click    ${locator}

I Am Redirected To The Contact Page
    [Documentation]    ...
    Get Url    should end with    assertion_expected=${CONTACT_LIST_PATHNAME}

I Am Redirected To The Login Page
    [Documentation]    ...
    Get Url    should end with    assertion_expected=${LOGIN_PATHNAME}
