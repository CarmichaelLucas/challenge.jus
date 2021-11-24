# frozen_string_literal: true

class ArticleWorker
  include Sidekiq::Worker

  def perform(args)
    data = JSON.parse(args)

    article = ArticleService.new(article: data['article'])
    article.executing_create(category: data['category'], page: data['page'])
  end
end
