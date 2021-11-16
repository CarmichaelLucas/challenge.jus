# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:category).class_name('Category') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe 'should publish at' do
    it 'with the valid date' do
      datetime = DateTime.now
      article = create(:article, :status_active, publish_at: datetime)

      expect(article.publish_at).to eq(datetime)
    end

    it 'without the valid date' do
      datetime = ''
      expect do
        create(:article, :status_active,
               publish_at: datetime)
      end.to raise_error(ActiveRecord::RecordInvalid, /Publish at is not a valid datetime/)
    end
  end
end
