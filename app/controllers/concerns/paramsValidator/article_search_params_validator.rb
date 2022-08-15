# frozen_string_literal: true

module ParamsValidator
  class ArticleSearchParamsValidator < ParamsValidator::Base
    validates :user, numericality: true
  end
end

