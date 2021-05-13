# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    user
    movie
    title { "MyText" }
    body { "MyText" }
  end
end
