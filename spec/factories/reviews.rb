# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    user
    movie
    title { FFaker::Book.title }
    body { FFaker::BaconIpsum.paragraph }
  end
end
