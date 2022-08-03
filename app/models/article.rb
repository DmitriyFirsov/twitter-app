# frozen_string_literal: true

class Article < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { in: 6...200 }

  belongs_to :user, optional: false

  def self.create_new(fields, current_user)
    new(fields.merge({ user: current_user }))
  end
end
