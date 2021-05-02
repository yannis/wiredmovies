# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:edit, :update, :destroy]

  root "movies#index"
end
