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

  def new
    if request.request_method == "GET"
      @article = Article.new
    else
      @article = Article.create_new permitted_article_fields, current_user
      if @article.save
        flash[:success] = "Article created"
        redirect_to action: :index
      end
    end
  end

  protected

  def permitted_article_fields
    params.require(:article).permit(:message)
  end
end
