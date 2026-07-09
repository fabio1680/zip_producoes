Rails.application.routes.draw do

  # Clientes
  resources :clientes

  # Eventos
  resources :eventos


  # Financeiro
  get "financeiro", to: "financeiro#index"


  # Dashboard de clientes
  get "dashboard/clientes", to: "dashboard#clientes"


  # Tela inicial ZIP Produções
  root "home#index"

end
