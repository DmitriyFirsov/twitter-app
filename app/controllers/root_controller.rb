# frozen_string_literal: true

class RootController < ApplicationController
  def index
    @articles = Article.eager_load(:user).all if user_signed_in?
  end
end
