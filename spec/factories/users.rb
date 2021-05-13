# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    admin { false }

    trait :admin do
      admin { true }
    end
  end
end
