# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new comments_params
    redirect_on_success if @comment.save
  end

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find_by!(user: current_user, id: params[:id])
  end

  def update
    @comment = Comment.find_by!(id: params[:id], user: current_user)
    if @comment.update comments_params
      redirect_on_success
    else
      render action: :edit
    end
  end

  def destroy
    @article = Article.find_by!(id: params[:id], user: current_user)
    @article.destroy
  end

  protected

  def redirect_on_success
    redirect_back fallback_location: root_path, allow_other_host: false
  end

  def comments_params
    params
      .require(:comment)
      .permit(:message)
      .merge({ user: current_user, article: params[:article_id] })
  end
end
