# frozen_string_literal: true

class Comment < ActiveRecord::Migration[6.1]
  def change
    create_table :comments, id: :uuid do |t|
      t.string :message, null: false, limit: 200

      t.references :user, null: false
      t.references :articles, null: false

      t.timestamps
    end
  end
end
