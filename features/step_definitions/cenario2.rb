#encoding: utf-8
#! ~/.rvm/gems/ruby-2.3.3/bin ruby
require 'httparty'


Given(/^a URL "([^"]*)" realizar um GET$/) do |arg1|
  @response = HTTParty.get(arg1)
end

When(/^armazenar o valor do campo count$/) do
  @count = @response['count']
  @new_count = Random.rand(1..9999)

end

Then(/^realizar um POST na URL "([^"]*)"$/) do |arg1|
  if (@new_count > @count)
    @result_post = HTTParty.post(arg1, :body => { 'count' => @new_count }, :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
  else
    puts "O valor do novo count: #{@new_count} e menor que count atual:#{@count}"
  end
end

Then(/^validar o status code com "([^"]*)" e a mensagem de retorno "([^"]*)"$/) do |arg1, arg2|
  if @result_post.code == arg1.to_i
    puts "Post efetuado com Sucesso; status code: #{@result_post.code}"
  else
    puts "Aconteceu algum erro: #{@result_post.code} com mensagem: #{@result_post.message}"
  end

 if @result_post.message == arg2
    puts "Mensagem recebida sao iguais #{@result_post.message}"
  else
    puts "Aconteceu algum erro: #{@result_post.code} com mensagem: #{@result_post.message}"
  end
end

