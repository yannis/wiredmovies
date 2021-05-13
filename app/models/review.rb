# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :user, inverse_of: :reviews
  belongs_to :movie, inverse_of: :reviews

  validates :title, presence: true
  validates :body, presence: true, uniqueness: {scope: :movie_id}
end
