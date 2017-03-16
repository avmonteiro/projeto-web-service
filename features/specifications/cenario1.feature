

Feature: Realizar Get na url e obter os nomes dos filmes

	Scenario: Obter nome dos filmes por título
		When cliente faz request GET na url "http://swapi.co/api/films"
		Then deverá aparecer os nomes dos filmes
		And validar status code com "200" e mensagem de retorno "OK"
