

Feature: Realizar Get na url e obter os nomes dos filmes

	Scenario: Obter nome dos filmes por título
		Given cliente faz request GET na url "http://swapi.co/api/films"
		When deverá aparecer os nomes dos filmes
		Then validar status code com "200" e mensagem de retorno "OK"
