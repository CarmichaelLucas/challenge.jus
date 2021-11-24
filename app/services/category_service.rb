# frozen_string_literal: true

class CategoryService
  def initialize(category:)
    @category = category
  end

  def executing_create
    return Category.find_or_create_default if @category['name'].nil?

    category_query = find_category_name
    return Category.create!(@category) if category_query.nil?

    category_query
  end

  private

  attr_accessor :category

  def find_category_name
    Category.find_by(name: @category['name'])
  end
end
