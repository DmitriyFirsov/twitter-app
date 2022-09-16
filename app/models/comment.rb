# frozen_string_literal: true

class Comment < ApplicationRecord
  validates :message, presence: true
  validates :message, length: { in: 6..200 }

  belongs_to :user, optional: false
  belongs_to :article, optional: false
end
