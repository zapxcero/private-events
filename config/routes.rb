# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  resources :users, only: %i[show]
  resources :events, only: %i[index new create show]
  resources :attendances, only: %i[create]
end
