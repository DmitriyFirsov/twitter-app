# frozen_string_literal: true

class ArticleIndexValidator < BaseQueryParamsValidator
  validates :user, format: { with: /^\d*$/m, multiline: true }
end
