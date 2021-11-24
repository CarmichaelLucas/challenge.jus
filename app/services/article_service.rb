# frozen_string_literal: true

class ArticleService
  def initialize(article:)
    @article = article
  end

  def executing_create(category:, page:)
    ActiveRecord::Base.transaction do
      executing_create_category(category: category)

      page['article'] = Article.create!(@article)

      executing_create_page(page: page)

      true
    rescue ActiveRecord => e
      raise ActiveRecord, "Message Error: #{e.message}"
    end
  end

  private

  attr_accessor :category, :article, :page

  def executing_create_category(category:)
    @article['category'] = CategoryService.new(category: category).executing_create
  end

  def executing_create_page(page:)
    PageService.new(page: page).executing_create
  end
end
