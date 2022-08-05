# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "users/registrations" }

  root to: "root#index"

  get "/articles/new", to: "article#new", as: "new_article"
  post "/articles/new", to: "article#new", as: "articles"
  get "/articles/:id/edit", to: "article#edit", as: "edit_article"
  patch "/articles/:id/edit", to: "article#edit"
  delete "/articles/:id", to: "article#remove", as: "remove_article"
  get "/articles", to: "article#index", as: "self_articles_list"
  get "/articles/:id", to: "article#index", as: "articles_list"
end
