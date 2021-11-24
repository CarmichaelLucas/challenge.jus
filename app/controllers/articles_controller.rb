# frozen_string_literal: true

class ArticlesController < ApplicationController
  # GET /articles
  def index
    articles = Article.all
    render json: articles
  end

  # GET /articles/1
  def show
    article = Article.find(params[:id])
    render json: article
  end

  # POST /articles
  def create
    data_worker = {
      category: category_params,
      article: article_params,
      page: page_params
    }.to_json

    article_worker = ArticleWorker.perform_in(1.minute, data_worker)

    render json: { job_id: article_worker }
  end

  private

  def article_params
    params.require(:article).permit(:title, :status, :publish_at)
  end
end
