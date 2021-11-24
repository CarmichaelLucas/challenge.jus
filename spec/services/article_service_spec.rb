# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticleService, type: :service do
  let(:category)  { JSON.parse(attributes_for(:category).to_json) }
  let(:article)   { JSON.parse(attributes_for(:article, :status_inactive, category: nil).to_json) }
  let(:page)      { JSON.parse(attributes_for(:page, article: nil).to_json) }

  let(:create)    { described_class.new(article: article).executing_create(category: category, page: page) }

  describe '#executing_create' do
    it { expect(create).to be_truthy }
    it { expect { create }.to change(Category, :count).by(1) }
    it { expect { create }.to change(Article, :count).by(1) }
    it { expect { create }.to change(Page, :count).by(1) }

    context 'when raise error in action of create' do
      let(:page) { JSON.parse(attributes_for(:page, number: nil, article: nil).to_json) }

      it { expect { create }.to raise_error(ActiveRecord::RecordInvalid) }
    end
  end
end
