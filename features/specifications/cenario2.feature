

Feature: Obter o valor de count do GET da url e realizar um POST do novo valor de count

  Scenario: GET na url e armazenar valor do count e fazer um post do novo valor do count
	  Given a URL "http://swapi.co/api/planets" realizar um GET
	  When armazenar o valor do campo count
	  Then realizar um POST na URL "http://swapi.co/api/planets"
	  And validar o status code com "200" e a mensagem de retorno "OK"
