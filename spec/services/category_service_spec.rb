# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryService, type: :service do
  let(:params) do
    data = attributes_for(:category).to_json
    JSON.parse(data)
  end
  let(:category) { described_class.new(category: params).executing_create }

  describe '#executing_create' do
    it { expect(category.class).to eq(Category) }
    it { expect(category).to be_valid }
    it { expect(category.name).to eq(params['name']) }
  end

  describe '#executing_create named default' do
    let(:params) do
      data = attributes_for(:category, name: nil).to_json
      JSON.parse(data)
    end

    it { expect(category.name).to eq('default') }
  end
end
