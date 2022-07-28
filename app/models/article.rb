# frozen_string_literal: true

class Article < ApplicationRecord
  validates :message, :user, presence: true
  validates :message, length: { in: 6...200 }

  belongs_to :user
end
