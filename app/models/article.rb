# frozen_string_literal: true

class Article < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :status, presence: true
  validates_datetime :publish_at
  validate :status_active_or_inactive, on: :create

  private

  def status_active_or_inactive
    errors.add(:status, 'is not valid') unless status.eql?('active') || status.eql?('inactive')
  end
end
