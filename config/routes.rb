Rails.application.routes.draw do

  # Página inicial
  root "home#index"

  # Clientes
  resources :clientes do
    collection do
      get :cadastro_rapido
      post :salvar_rapido
    end
  end

  # Eventos
  resources :eventos do
    member do
      get :contrato
    end
  end

  # Financeiro
  get "financeiro", to: "financeiro#index"

  # Dashboard
  get "dashboard/clientes", to: "dashboard#clientes"

end