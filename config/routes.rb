# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "users/registrations" }

  root to: "articles#index"

  resources :articles, only: %i[create new edit destroy update] do
    resources :comments, only: %i[create new edit destroy update]
  end

  get "/articles/:id", to: "articles#user_articles", as: "user_articles_list"
  get "/articles/my", to: "articles#user_articles", as: "self_articles_list"
end
