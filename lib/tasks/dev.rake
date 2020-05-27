namespace :dev do
  desc "Cria o aBanco padrão com tasks automaticas (db:drop db:create db:migrate db:seed)"
  task setup: :environment do         
        show_spinner("Excluindo banco...") { %x(rails db:drop:_unsafe) } # o campo yield no metodo 'show_spinner' rodará o código dentro de %x()
        show_spinner("Criando banco...") { %x(rails db:create) }  # outro exemplo para usar o yield é digitando o codigo entre do e end quando invocar proprio metodo
        show_spinner("Migrando banco...") { %x(rails db:migrate) } # a TASK roda os comandos para terminal de uma vez só       
        %x(rails dev:add_mining_types)
        %x(rails dev:add_coins)
      end
      private
      def show_spinner(msg_start)
        spinner = TTY::Spinner.new("[:spinner] #{msg_start}") # cria um spinner para loading do processo
        spinner.auto_spin # roda o spinner sem necessario tempo predefinido
        yield # aqui será rodado o codigo dentro de %x()
        spinner.success('Feito!') # Saida na tela indicando que o processo foi feito.
      end

  desc "popula o banco Coin"
  task add_coins: :environment do
    show_spinner("Populando banco Coin...") do
      coins = [
        {
          description: "Bitcoin",
          acronym: "BTC",
          url_image: "https://steemitimages.com/640x0/https://cdn.steemitimages.com/DQmd6vzKDCAFapifCYBZ4gJ6SruTvdcuEkHZ6qeADU2pUNn/bitcoin.png",
          mining_type: MiningType.find_by(acronym: 'PoW') # find_by encontra um elemento por sigla, find por numero de idn e where encontra varios elementos 
        },

        {
          description: "Ethereum",
          acronym: "ETH",
          url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png",
          mining_type: MiningType.all.sample
        },

        {
          description: "Dash",
          acronym: "DASH",
          url_image: "https://pngimage.net/wp-content/uploads/2018/05/dash-png-9.png",
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end 
  end

  desc "popula o banco MiningType"
  task add_mining_types: :environment do
    show_spinner("Populando banco MiningType...") do
    mining_types = [
        { description: "Proof of Work",acronym: "PoW"},
        { description: "Proof of Stake",acronym: "PoS"},
        { description: "Proof of Capacity",acronym: "PoC"}
      ]

      mining_types.each do |mining|
        MiningType.find_or_create_by!(mining)
      end 
    end
  end
end