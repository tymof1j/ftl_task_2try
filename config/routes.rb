# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :spendings
  resources :shared_lists, except: %i[destroy update]
  root to: 'spendings#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
