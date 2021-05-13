# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :reviews, inverse_of: :movie, dependent: :destroy

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :description, presence: true, uniqueness: {case_sensitive: false}
end
