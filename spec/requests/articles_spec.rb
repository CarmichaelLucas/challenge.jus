# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      get '/articles', as: :json

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:article) { create(:article, :status_active) }

    it 'renders a successful response' do
      get "/articles/#{article.id}", as: :json

      expect(response).to have_http_status(:success)
    end

    it 'renders a not found response' do
      expect do
        get '/articles/0', as: :json
      end.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'POST /create' do
    let(:category) { attributes_for(:category) }
    let(:article) { attributes_for(:article, :status_active, category: nil) }
    let(:page) { attributes_for(:page, article: nil) }
    let(:params) do
      {
        category: category,
        article: article,
        page: page
      }
    end

    it 'renders a successful response' do
      post '/articles', params: params, as: :json

      expect(response).to have_http_status(:success)
    end
  end
end
