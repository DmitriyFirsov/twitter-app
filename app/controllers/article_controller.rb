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
    detect_current_user

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
    @article = Article.create_new permitted_article_fields, current_user

    return redirect_on_success I18n.t "articles.new.success" if @article.save

    render action: :new
  end

  def edit
    @article = Article.find_by!(id: params[:id], user: current_user)

    return unless request.request_method == "PATCH"

    @article.update permitted_article_fields

    return unless @article.save

    redirect_on_success I18n.t "articles.edit.success"
  end

  def remove
    @article = Article.find_by!(id: params[:id], user: current_user)
    @article.destroy
  end

  protected

  def detect_current_user
    @user = if params[:id]
              User.find_by!(id: params[:id])
            else
              current_user
            end
  end

  def redirect_on_success(message)
    flash[:success] = message
    redirect_to self_articles_list_path
  end

  def permitted_article_fields
    params.require(:article).permit(:message)
  end
end
