# frozen_string_literal: true

class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :publish_at

  belongs_to :category

  def category
    category = object.category

    {
      id: category.id,
      name: category.name
    }
  end
end
