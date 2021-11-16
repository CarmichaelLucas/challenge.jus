# frozen_string_literal: true

FactoryBot.define do
  factory :page do
    number { Faker::Number.between(from: 1, to: 100) }
    content { Faker::Books::Lovecraft.paragraph_by_chars(characters: 8000) }

    association :article, factory: %i[article status_active]
  end
end
