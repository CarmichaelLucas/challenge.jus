# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    publish_at { DateTime.now }
    association :category, factory: :category

    trait :status_active do
      status { true }
    end

    trait :status_inactive do
      status { false }
    end
  end
end
