# frozen_string_literal: true

class ArticleMessageLengthFix < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :message, :string, limit: 200
  end
end
