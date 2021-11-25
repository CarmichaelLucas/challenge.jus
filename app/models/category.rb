# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true

  def self.find_or_create_default
    category = Category.find_or_initialize_by(name: 'default')

    if category.new_record?
      category.save! 
    end
    
    category
  end
end
