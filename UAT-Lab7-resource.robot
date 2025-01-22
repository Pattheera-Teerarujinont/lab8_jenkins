* Settings *
Library    SeleniumLibrary

* Variables *
${SERVER}          localhost:7272
${BROWSER}         Chrome
${DELAY}           0.2
${VALID USER}      demo
${VALID PASSWORD}  mode
${FORM URL}     http://${SERVER}/Form.html
${Complete URL}     http://${SERVER}/Complete.html
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}Google Chrome for Testing.app${/}Contents${/}MacOS${/}Google Chrome for Testing
${CHROME_DRIVER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chromedriver
    
* Keywords *
Open Browser To Form Page
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH} 
    ${service}=    Evaluate    sys.modules['selenium.webdriver.chrome.service'].Service(executable_path=r'${CHROME_DRIVER_PATH}')    sys, selenium.webdriver.chrome.service
    Create WebDriver    Chrome    options=${options}    service=${service}
    Set Selenium Speed    ${DELAY}
    Go To    ${FORM URL}
    Form Page Should Be Open

Form Page Should Be Open
    Location Should Be    ${FORM_URL}
    Title Should Be       Customer Inquiry

Input Firstname
    [Arguments]    ${firstname}
    Input Text    id=firstname   ${firstname}

Input Lastname
    [Arguments]    ${lastname}
    Input Text    id=lastname    ${lastname}

Input Destination
    [Arguments]    ${destination}
    Input Text    id=destination    ${destination}

Input Contactperson
    [Arguments]    ${contactperson}
    Input Text    id=contactperson    ${contactperson}

Input Relationship
    [Arguments]    ${relationship}
    Input Text    id=relationship    ${relationship}

Input Email
    [Arguments]    ${email}
    Input Text    id=email   ${email}

Input Phone
    [Arguments]    ${phone}
    Input Text    id=phone    ${phone}

Submit Contact Information
    Click Button    id=submitButton

Complete Page Should Be Open
    Location Should Be    ${Complete URL}
    Title Should Be    Completed
    Page Should Contain    Our agent will contact you shortly.
    Page Should Contain    Thank you for your patient.

Error Message Should Be Shown
    [Arguments]    ${error_message}
    Element Text Should Be    id=errors    ${error_message}
