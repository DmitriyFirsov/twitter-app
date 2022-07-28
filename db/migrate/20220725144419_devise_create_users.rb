# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def add_indexes
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end

  def additional_fields
    change_table :users do |t|
      t.string :name, null: false
      t.string :surname, null: false
    end
  end

  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    additional_fields
    add_indexes
  end
end
