#encoding: utf-8
#! ~/.rvm/gems/ruby-2.3.3/bin ruby
require 'httparty'


Given(/^cliente faz request GET na url "([^"]*)"$/) do |arg1|
   @response = HTTParty.get(arg1)
end

When(/^deverá aparecer os nomes dos filmes$/) do
  @response['results'].each {|filter|
	puts "Nome do filme por titulo: #{filter['title']}"}
end

Then(/^validar status code com "([^"]*)" e mensagem de retorno "([^"]*)"$/) do |arg1, arg2|
  if @response.code == arg1.to_i
    puts "Post efetuado com Sucesso; status code: #{@response.code}"
  else
    puts "Aconteceu algum erro: #{@response.code} com mensagem: #{@response.message}"
  end

 if @response.message == arg2
    puts "Mensagem recebida sao iguais #{@response.message}"
  else
    puts "Aconteceu algum erro: #{@response.code} com mensagem: #{@response.message}"
  end
end

