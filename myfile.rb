# .map = seleciona ou altera todos os valores de um atributo informado em bloco de codigo.

# syntax:

a = [1,2,3,4,5,6]

puts a.map do |valores|
valores * 2
end

# syntax 2:

c = Coin.all

puts c.map { |moeda| [moeda.description, moeda.acronym] } # substitui o do e end por {} e faz uma busca pelos valores dentro de description e acronym

# syntax 3:

c = Coin.all

puts c.map(&:description) #obtém o mesmo resultado da syntax 2 porém com a utilização do '&'. não se pode utilizar com dois valores, para isso utilizar o .pluck

#########################

# .pluck carrega 1 ou mais atributos de uma vez só.

# syntax 

c = Coin.all

puts c.pluck(:description, :acronym)


######################



=begin 
Para ver os exemplos favor acessar o terminal e teclar a syntax desejada
=end


