# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:article).class_name('Article') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'should content is at most of the chars' do
    it { is_expected.to validate_length_of(:content).is_at_most(8000) }
  end
end
