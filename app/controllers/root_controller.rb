# frozen_string_literal: true

class RootController < ApplicationController
  def index
    @articles = if user_signed_in?
                  Article
                    .eager_load(:user)
                    .reorder(created_at: :desc)
                    .all
                else
                  []
                end
    @show_article_author = true
  end
end
