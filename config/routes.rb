# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "users/registrations" }

  root to: "articles#index"

  resources :articles, only: %i[create new edit destroy update]
end
