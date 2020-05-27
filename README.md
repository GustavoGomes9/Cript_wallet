# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

  Checar em: Gemfile.lock

* Configuration
  
  Foi criado uma relação na tabela MiningType < Coin utilizando a sintaxe: rails g scaffold AddMiningTypeToCoin  
  conhecida como associação "standalone"

  Associação foi feita com belongs_to na model Coin e has_many na model MiningType = path: /app/model/coin || /app/model/miningtype

* Database creation
 
 Database Coin( description:string, acronym:string, url_image:string, miningtype:references)

 Database MiningType( description:string, acronym:string)
  
* Database initialization

  Foi criado a task dev:setup que inicia um processo de restauração do banco padrão. = path /lib/tasks/dev.rake 

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
