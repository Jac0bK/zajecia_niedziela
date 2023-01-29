*** Settings ***
Library     Collections

*** Variables ***
@{my_list}   1  2  3  4
${zmienna}   4
${slowo}    WSB


*** Test Cases ***
List Basic
    FOR     ${index}   IN   @{my_list}
        LOG     ${index}
    END

    append to list   ${my_list}   ${4}
    append to list   ${my_list}   wyraz
    append to list   ${my_list}   wyraz
    append to list   ${my_list}   ${slowo}
    LOG     ${my_list}

    ${my_list}   remove duplicates  ${my_list}
    LOG     ${my_list}
    remove values from list    ${my_list}  2   3
    LOG     ${my_list}

    list should contain value   ${my_list}   WSB
