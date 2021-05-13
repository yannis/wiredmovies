# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    resources :reviews, only: %i[index new create]
  end
  resources :reviews, only: %i[show edit update destroy]

  root "movies#index"
end
