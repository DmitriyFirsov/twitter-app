# frozen_string_literal: true

class ArticleController < ApplicationController
  before_action :authenticate_user!

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

  def user_articles
    @articles = Article
                .where("user_id = ?", params[:id] || current_user.id)
                .eager_load(:user)
                .reorder(created_at: :desc)
                .all
    @show_article_author = false
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create_new permitted_article_fields, current_user

    if @article.save
      flash[:success] = "Article created"
      return redirect_to action: :index
    end

    render action: :new
  end

  def edit
    @article = Article.find_by!(id: params[:id], user: current_user)

    return unless request.request_method == "PATCH"

    @article.update permitted_article_fields

    return unless @article.save

    flash[:success] = "Article edited"
    redirect_to self_articles_list_path
  end

  def remove
    @article = Article.find_by!(id: params[:id], user: current_user)
    @article.destroy
  end

  protected

  def permitted_article_fields
    params.require(:article).permit(:message)
  end
end
