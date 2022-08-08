# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :user, controllers: { registrations: "users/registrations" }

  root to: "article#index", as: "all_articles_list"

  get "/articles/new", to: "article#new", as: "new_article"
  post "/articles/new", to: "article#create"

  get "/articles/:id/edit", to: "article#edit", as: "edit_article"
  patch "/articles/:id/edit", to: "article#edit"

  delete "/articles/:id", to: "article#destroy", as: "remove_article"

  get "/articles", to: "article#user_articles", as: "self_articles_list"
  get "/articles/:id", to: "article#user_articles", as: "user_articles_list"
end
