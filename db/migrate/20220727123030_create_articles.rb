# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :message, null: false, limit: 120
      t.references :user, null: false

      t.timestamps
    end
  end
end
