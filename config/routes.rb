# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'events#index'

  resources :users, only: %i[show]
end
