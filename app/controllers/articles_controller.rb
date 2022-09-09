# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_index_props, only: [:index]

  def index
    @articles = Article
                .eager_load(:user)
                .order(created_at: :desc)

    @articles = @articles.where("user_id = ?", params[:user]) if params[:user]

    @user_filter = (User.find_by(id: params[:user]) if params[:user])
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
    if @article.update article_params
      redirect_on_success t "articles.edit.success"
    else
      render action: :edit
    end
  end

  def destroy
    article = Article.find_by!(id: params[:id], user: current_user)
    article.destroy
    flash[:success] = t("articles.destroy.success")
  end

  protected

  def validate_index_props
    validator = ParamsValidator::ArticleSearchParamsValidator.new(params)
    redirect_to root_path unless validator.valid?
  end

  def clean_up_filter_params
    params
      .permit(:user)
  end

  def redirect_on_success(message)
    flash[:success] = message
    redirect_to root_path(user: current_user)
  end

  def article_params
    params
      .require(:article)
      .permit(:message)
      .merge({ user: current_user })
  end
end
