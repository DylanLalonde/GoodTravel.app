# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :experience
  validates :content, length: { minimum: 20 }
end
