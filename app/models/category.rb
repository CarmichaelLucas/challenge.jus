# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true

  def self.find_or_create_default
    category = Category.find_or_initialize_by(name: 'default')

    category.save! if category.new_record?

    category
  end
end
