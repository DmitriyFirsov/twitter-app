# frozen_string_literal: true

class ArticleController < ApplicationController
  before_action :authenticate_user!

  def index
    @articles = Article
                .where(["user_id = ?", current_user.id])
                .eager_load(:user)
                .reorder(created_at: :desc)
                .all
    @show_article_author = false
  end

end
