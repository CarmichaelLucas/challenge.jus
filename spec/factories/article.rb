# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    publish_at { DateTime.now }

    trait :status_active do
      status { 'active' }
    end

    trait :status_inactive do
      status { 'inactive' }
    end

    association :category, factory: :category
  end
end
