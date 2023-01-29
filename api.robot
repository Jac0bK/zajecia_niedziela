*** Settings ***
Library     RequestsLibrary

*** Variables ***

${token}    7d4f95ab72399a5eb469fdee27a161ad8d76c0999942917130e57a90ecbdf2f6

*** Test Cases ***
API_GET_TEST_STATUS
    ${get_response}     GET     https://simple-books-api.glitch.me/status
    log to console      status ${get_response}

API_GET_TEST_BOOKS
    ${get_response}     GET     https://simple-books-api.glitch.me/books
    log to console      status ${get_response}

#POST_REGISTRATION
#    ${register_json}    create dictionary   clientName=Jakub   clientEmail=jakub@example.com
#    ${register_json}    POST    https://simple-books-api.glitch.me/api-clients/
#    ...                         json=${register_json}

ORDER

    ${headers}      create dictionary   Content-Type=application/json   Authorization=Bearer ${token}
    ${order_body}   create dictionary       bookId=4    customerName=Jakub
    ${post_order_response}  POST    https://simple-books-api.glitch.me/orders   headers=${headers}   json=${order_body}