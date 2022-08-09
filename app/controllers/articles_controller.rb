# frozen_string_literal: true

class ArticlesController < ApplicationController
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
    return redirect_to self_articles_list_path if (params[:id] != "my") && (current_user.id.to_s == params[:id])

    detect_user

    @articles = Article
                .where("user_id = ?", @user.id)
                .eager_load(:user)
                .reorder(created_at: :desc)
                .all

    @show_article_author = false
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new article_params

    return redirect_on_success t "articles.new.success" if @article.save

    render action: :new
  end

  def edit
    @article = Article.find_by!(id: params[:id], user: current_user)
  end

  def update
    @article = Article.find_by!(id: params[:id], user: current_user)
    @article.update article_params

    return unless @article.save

    redirect_on_success t "articles.edit.success"
  end

  def destroy
    @article = Article.find_by!(id: params[:id], user: current_user)
    @article.destroy
    flash[:success] = t("articles.destroy.success")
  end

  protected

  def detect_user
    @user = if params[:id] == "my"
              current_user
            else
              User.find_by!(id: params[:id])
            end
  end

  def redirect_on_success(message)
    flash[:success] = message
    redirect_to self_articles_list_path
  end

  def article_params
    params
      .require(:article)
      .permit(:message)
      .merge({ user: current_user })
  end
end
