# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PageService, type: :service do
  let(:category) { create(:category) }
  let(:article) { create(:article, :status_inactive, category: category) }
  let(:params) { attributes_for(:page, article: nil, article_id: article.id) }
  let(:page) { described_class.new(page: params).executing_create }

  describe '#executing_create' do
    it { expect(page.class).to eq(Page) }
    it { expect(page).to be_valid }
    it { expect(page.number).to eq(params[:number]) }
    it { expect(page.content).to eq(params[:content]) }
    it { expect(page.article.id).to eq(params[:article_id]) }
  end
end
