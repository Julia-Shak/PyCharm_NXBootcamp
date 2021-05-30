*** Settings ***
Library    Collections

*** Variables ***
@{ARRAY}=  1  2  3  5  1  0  -1  10

*** Test Cases ***
Max Value
    ${result}  Get Max Or Min  ${ARRAY}  True
    Log To Console  ${result}
    log  ${result}

Min Value
    ${result}  Get Max Or Min  ${ARRAY}  False
    Log To Console  ${result}
    log  ${result}

Unique Values
    ${result}  Remove Duplicates  ${ARRAY}
    log list  ${result}

Sum
    ${result}=  Set Variable  0
    FOR  ${number}  IN  @{ARRAY}
        ${s}=  Evaluate  ${number}+${result}
        ${result}=  Set Variable  ${s}
    END
    Log To Console  ${result}

*** Keyword ***
Get Max Or Min
    [Arguments]  ${MyList}  ${max}
    ${result}=  Get From List  ${MyList}  0
    FOR  ${number}  IN  @{MyList}
        IF  ${max} == True
            IF  ${number} > ${result}
                ${result}  Set Variable  ${number}
            END
        ELSE
            IF  ${number} < ${result}
                ${result}  Set Variable  ${number}
            END
        END
    END
    [Return]  ${result}