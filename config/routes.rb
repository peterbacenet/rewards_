Rails.application.routes.draw do
  # test cookies.. 
  Rails.application.routes.draw do
    get "/hello", to: "application#hello_world"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
