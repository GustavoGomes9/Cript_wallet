class WelcomeController < ApplicationController
  def index
    @nome = params[:nome] 
    @creator = "Gustavo Gomes"
  end  
end
# a var global params pega os valores enviados pelo request da url(Query params).
# A variavel de sessão @nome fará contato com a view index da controller welcome.