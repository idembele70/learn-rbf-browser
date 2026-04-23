# Test Cases — Registration Page
**URL:** `https://thinking-tester-contact-list.herokuapp.com/addUser`  
**Framework:** Robot Framework Browser  
**Style:** Gherkin / BDD

---

## 🟢 Happy Path

---

### TC-001 — Successful registration with all valid data
**Tags:** `happy` `smoke` `register`

```gherkin
Given I am on the register page
When I enter "John" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter "john.doe@example.com" in the "Email" field
And I enter "P@ssword123" in the "Password" field
And I click "Submit"
Then I am redirected to the contact page
```

---

### TC-002 — Registration with a hyphenated first name
**Tags:** `happy` `register` `name-format`

```gherkin
Given I am on the register page
When I enter "Marie-Claire" in the "First Name" field
And I enter "Martin" in the "Last Name" field
And I enter "marie-claire.martin@example.com" in the "Email" field
And I enter "SecurePass1!" in the "Password" field
And I click "Submit"
Then I am redirected to the contact page
```

---

### TC-003 — Registration with an uppercase email
**Tags:** `happy` `register` `email-format`

```gherkin
Given I am on the register page
When I enter "Jane" in the "First Name" field
And I enter "Smith" in the "Last Name" field
And I enter "JANE.SMITH@EXAMPLE.COM" in the "Email" field
And I enter "ValidPass99!" in the "Password" field
And I click "Submit"
Then I am redirected to the contact page
```

---

### TC-004 — Registration with a password at minimum accepted length
**Tags:** `happy` `register` `password`

```gherkin
Given I am on the register page
When I enter "Alice" in the "First Name" field
And I enter "Dupont" in the "Last Name" field
And I enter "alice.dupont@example.com" in the "Email" field
And I enter "Abcd1234" in the "Password" field
And I click "Submit"
Then I am redirected to the contact page
```

---

### TC-005 — Cancel button redirects to the login page
**Tags:** `happy` `navigation`

```gherkin
Given I am on the register page
When I click "Cancel"
Then I am redirected to the login page
And no user is created
```

---

## 🔴 Negative Cases

---

### TC-006 — Submitting an empty form
**Tags:** `negative` `validation` `required-fields`

```gherkin
Given I am on the register page
When I click "Submit" without filling any field
Then an error message is displayed
And I remain on the register page
```

---

### TC-007 — Email without @ symbol
**Tags:** `negative` `validation` `email-format`

```gherkin
Given I am on the register page
When I enter "Bob" in the "First Name" field
And I enter "Lee" in the "Last Name" field
And I enter "boblee.example.com" in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then an email format error message is displayed
And I remain on the register page
```

---

### TC-008 — Email without domain
**Tags:** `negative` `validation` `email-format`

```gherkin
Given I am on the register page
When I enter "Bob" in the "First Name" field
And I enter "Lee" in the "Last Name" field
And I enter "bob@" in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then an email format error message is displayed
And I remain on the register page
```

---

### TC-009 — Email without extension (e.g. .com)
**Tags:** `negative` `validation` `email-format`

```gherkin
Given I am on the register page
When I enter "Bob" in the "First Name" field
And I enter "Lee" in the "Last Name" field
And I enter "bob@example" in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then an email format error message is displayed
And I remain on the register page
```

---

### TC-010 — Empty "First Name" field
**Tags:** `negative` `validation` `required-fields`

```gherkin
Given I am on the register page
When I leave the "First Name" field empty
And I enter "Doe" in the "Last Name" field
And I enter "john.doe@example.com" in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then an error message is displayed indicating the first name is required
And I remain on the register page
```

---

### TC-011 — Empty "Last Name" field
**Tags:** `negative` `validation` `required-fields`

```gherkin
Given I am on the register page
When I enter "John" in the "First Name" field
And I leave the "Last Name" field empty
And I enter "john.doe@example.com" in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then an error message is displayed indicating the last name is required
And I remain on the register page
```

---

### TC-012 — Empty "Email" field
**Tags:** `negative` `validation` `required-fields`

```gherkin
Given I am on the register page
When I enter "John" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I leave the "Email" field empty
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then an error message is displayed indicating the email is required
And I remain on the register page
```

---

### TC-013 — Empty "Password" field
**Tags:** `negative` `validation` `required-fields`

```gherkin
Given I am on the register page
When I enter "John" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter "john.doe@example.com" in the "Email" field
And I leave the "Password" field empty
And I click "Submit"
Then an error message is displayed indicating the password is required
And I remain on the register page
```

---

### TC-014 — Registration with an already existing email
**Tags:** `negative` `validation` `duplicate`

```gherkin
Given a user with the email "existing@example.com" already exists
And I am on the register page
When I enter "John" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter "existing@example.com" in the "Email" field
And I enter "AnotherPass1!" in the "Password" field
And I click "Submit"
Then an error message is displayed indicating the email is already in use
And I remain on the register page
```

---

### TC-015 — Password too short
**Tags:** `negative` `validation` `password`

```gherkin
Given I am on the register page
When I enter "John" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter "john.doe@example.com" in the "Email" field
And I enter "abc" in the "Password" field
And I click "Submit"
Then an error message is displayed indicating the password is too short
And I remain on the register page
```

---

## ⚠️ Edge Cases

---

### TC-016 — Fields filled with whitespace only
**Tags:** `edge` `validation` `whitespace`

```gherkin
Given I am on the register page
When I enter "   " in the "First Name" field
And I enter "   " in the "Last Name" field
And I enter "   @   .  " in the "Email" field
And I enter "   " in the "Password" field
And I click "Submit"
Then an error message is displayed
And I remain on the register page
```

---

### TC-017 — SQL injection in the "First Name" field
**Tags:** `edge` `security` `injection`

```gherkin
Given I am on the register page
When I enter "' OR '1'='1" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter "sql@example.com" in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then the application does not crash
And no sensitive data is exposed
```

---

### TC-018 — XSS injection in the "First Name" field
**Tags:** `edge` `security` `xss`

```gherkin
Given I am on the register page
When I enter "<script>alert('XSS')</script>" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter "xss@example.com" in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then no script is executed in the browser
And the application handles the input securely
```

---

### TC-019 — Fields with valid special characters
**Tags:** `edge` `validation` `special-chars`

```gherkin
Given I am on the register page
When I enter "José" in the "First Name" field
And I enter "Ñoño" in the "Last Name" field
And I enter "jose.nono@example.com" in the "Email" field
And I enter "Sp3c!alP@ss" in the "Password" field
And I click "Submit"
Then I am redirected to the contact page
```

---

### TC-020 — "First Name" field with 255 characters (upper boundary)
**Tags:** `edge` `boundary` `max-length`

```gherkin
Given I am on the register page
When I enter a 255-character string in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter "longname@example.com" in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then the application accepts or rejects the input with an appropriate message
```

---

### TC-021 — "Email" field with 254 characters (RFC 5321 limit)
**Tags:** `edge` `boundary` `email-format`

```gherkin
Given I am on the register page
When I enter "John" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter a valid 254-character email in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then the application accepts or rejects the input with an appropriate message
```

---

### TC-022 — Password filled with whitespace only
**Tags:** `edge` `validation` `password` `whitespace`

```gherkin
Given I am on the register page
When I enter "John" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter "john.doe@example.com" in the "Email" field
And I enter "        " in the "Password" field
And I click "Submit"
Then an error message is displayed
And I remain on the register page
```

---

### TC-023 — Copy-paste into the Password field
**Tags:** `edge` `ux` `password`

```gherkin
Given I am on the register page
When I copy "ValidPass1!" to the clipboard
And I paste the value into the "Password" field
And I fill in the other fields with valid data
And I click "Submit"
Then I am redirected to the contact page
```

---

### TC-024 — Password field is masked by default
**Tags:** `edge` `ux` `password` `security`

```gherkin
Given I am on the register page
When I enter "MySecret!" in the "Password" field
Then the "Password" field displays masked characters (type="password")
And the entered value is not visible in plain text on screen
```

---

### TC-025 — Double-click on the Submit button
**Tags:** `edge` `ux` `idempotency`

```gherkin
Given I am on the register page
And I have filled all fields with valid data
When I rapidly double-click the "Submit" button
Then only one user is created in the database
And I am redirected to contact only once
```

---

### TC-026 — Page reload after successful submission
**Tags:** `edge` `navigation` `ux`

```gherkin
Given I have successfully submitted the form and I am on contact
When I navigate back to register in the browser
And I attempt to submit the same form again
Then the application handles the duplicate registration attempt
And an appropriate message is displayed
```

---

### TC-027 — Behaviour with JavaScript disabled
**Tags:** `edge` `accessibility` `no-js`

```gherkin
Given JavaScript is disabled in the browser
When I navigate to the register page
Then the page loads correctly or displays an informational message
And the form is accessible or a fallback message is present
```

---

### TC-028 — Keyboard-only navigation using Tab
**Tags:** `edge` `accessibility` `keyboard`

```gherkin
Given I am on the register page
When I navigate between fields using only the Tab key
Then the focus order follows the visual order of the form
And all fields and buttons are reachable via keyboard
```

---

### TC-029 — Email with subdomain
**Tags:** `edge` `email-format`

```gherkin
Given I am on the register page
When I enter "John" in the "First Name" field
And I enter "Doe" in the "Last Name" field
And I enter "john.doe@mail.example.co.uk" in the "Email" field
And I enter "ValidPass1!" in the "Password" field
And I click "Submit"
Then I am redirected to the contact page
```

---

### TC-030 — Page title and field labels verification
**Tags:** `edge` `ui` `smoke`

```gherkin
Given I am on the register page
Then the page title is "Add User"
And the "First Name" field is visible and correctly labelled
And the "Last Name" field is visible and correctly labelled
And the "Email" field is visible and correctly labelled
And the "Password" field is visible and correctly labelled
And the "Submit" button is visible and clickable
And the "Cancel" button is visible and clickable
```