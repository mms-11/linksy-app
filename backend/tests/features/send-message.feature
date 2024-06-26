Feature: Get Conversation Messages

  Scenario: Enviar mensagens em conversas
    Given existe um user com id "3", username "crc"
    And existe um user com id "5", username "mms11"
    And existe uma conversation com id "4", name "null", picture "null", isGroup "false"
    And existe uma userConversation com userId "3", conversationId "4"
    And existe uma userConversation com userId "5", conversationId "4"
    When o corpo da requisição é um JSON com content "Olá, tudo bem?" e createdAt "2024-06-17T00:29:57.933Z"
    And uma requisição "POST" for enviada para "/user/3/conversation/4"
    Then o status da resposta deve ser "201"
    And o JSON da resposta deve conter content "Olá, tudo bem?", senderId "3", conversationId "4" e createdAt "2024-06-17T00:29:57.933Z"