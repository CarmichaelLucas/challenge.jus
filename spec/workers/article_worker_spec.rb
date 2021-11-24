# frozen_string_literal: true

require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe ArticleWorker, type: :worker do
  let(:params) do
    {
      category: attributes_for(:category),
      article: attributes_for(:article, :status_active, category: nil),
      page: attributes_for(:page, article: nil)
    }
  end

  let(:worker) { described_class.perform_in(params.to_json) }

  it { expect(described_class.new).to respond_to(:perform) }
  it { expect { worker }.to change(described_class.jobs, :size).by(1) }
end
