Rails.application.routes.draw do
  resources :mining_types
  get 'welcome/index'
  #get 'welcome/index, to: 'welcome#index' // o # serve para separar controller da ação'
  resources :coins #resource mapeia os 7 routes do recurso coins para a utilização do crud
  #get '/coins', to: 'coins#index // exemplo de crição de routes'
  root 'welcome#index' #obriga o servidor a rodar a aplicação a partir dessa rota
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
