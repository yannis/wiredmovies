# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    name { FFaker::Movie.title }
    description { FFaker::Lorem.paragraph }
    director { FFaker::Name.name }
  end
end
