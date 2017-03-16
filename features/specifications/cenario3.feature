
Feature: Obter o valor de count do GET da url e realizar um GET do novo valor de count

  Scenario: GET na url e armazenar valor do count e fazer um GET do novo valor do count
    Given na URL "http://swapi.co/api/planets"
    When armazenar o valor do campo count e gerar um valor aleatorio para o novo count
    Then realizar um GET na URL "http://swapi.co/api/planets" com o novo count
    And validar o retorno do status code com "200" e o texto da mensagem de retorno "OK"

