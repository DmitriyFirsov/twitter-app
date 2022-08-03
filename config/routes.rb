# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "root#index"

  devise_for :user

  get "/articles", to: "article#index", as: "self_articles_list"
  get "/articles/new", to: "article#new", as: "new_article"
  post "/articles/new", to: "article#new"
end
