# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "users/registrations" }

  root to: "root#index"

  get "/articles", to: "article#index", as: "self_articles_list"
  get "/articles/new", to: "article#new", as: "new_article"
  post "/articles/new", to: "article#new"
end
