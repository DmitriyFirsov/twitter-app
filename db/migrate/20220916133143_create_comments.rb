# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :message, null: false, limit: 200
      t.references :user, null: false
      t.references :article, null: false

      t.timestamps
    end
  end
end
