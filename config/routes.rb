Rails.application.routes.draw do
  get 'user/profile'
  get '/welcome/:id', to: 'welcome#say_hello'
  get '/team', to: 'team#show'
  get '/contact', to: 'contact#show'
  root 'gossip#index'
  get "/user/:id", to: 'user#profile', as:'user'
  resources :gossip
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
