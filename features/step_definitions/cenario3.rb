require 'httparty'

Given(/^na URL "([^"]*)"$/) do |arg1|
  @response_get = HTTParty.get(arg1)
end

When(/^armazenar o valor do campo count e gerar um valor aleatorio para o novo count$/) do
  @count_ = @response_get['count']
  @new_count_ = Random.rand(1..9999)

end

Then(/^realizar um GET na URL "([^"]*)" com o novo count$/) do |arg1|
  if (@new_count_ > @count_)
    @result_get = HTTParty.get(arg1, :body => { 'count' => @new_count_ } )
  else
    puts "O valor do novo count: #{@new_count_} e menor que count atual:#{@count_}"
  end
end

Then(/^validar o retorno do status code com "([^"]*)" e o texto da mensagem de retorno "([^"]*)"$/) do |arg1, arg2|
  if @result_get.code == arg1
    puts "Post efetuado com Sucesso; status code: #{@result_get.code}"
  else
    puts "Aconteceu algum erro: #{@result_get.code} com mensagem: #{@result_get.message}"
  end

  if @result_get.message == arg2
    puts "Mensagem recebida sao iguais #{@result_get.message}"
  else
    puts "Aconteceu algum erro: #{@result_get.code} com mensagem: #{@result_get.message}"
  end
end


