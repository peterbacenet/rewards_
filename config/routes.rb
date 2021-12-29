# test cookies.. 
Rails.application.routes.draw do
  resources :transactions
  resources :partners
  resources :users

  get "/hello", to: "application#hello_world"
  post "/spend", to: "transactions#spend"
  get "/balance", to: "partners#points_balance"
  get "/balance/:id", to: "partners#balance"
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

