# frozen_string_literal: true

class Article < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { in: 6..200 }

  belongs_to :user, optional: false
  has_many :comments, dependent: :destroy
end
