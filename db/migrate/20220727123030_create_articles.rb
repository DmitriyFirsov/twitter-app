# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :message
      t.references :user

      t.timestamps
    end
  end
end
