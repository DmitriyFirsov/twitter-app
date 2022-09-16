# frozen_string_literal: true

class CommentsController < ApplicationController
  def index
    @article = Article
               .eager_load(:comments)
               .find_by!(id: params[:article_id])
  end
end
