# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  resources :gossip
  resources :user
  resources :welcome
  resources :contact
  resources :team
  resources :city
  resources :sessions, only: %i[new create destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
