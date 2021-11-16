# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :article

  validates :number, presence: true
  validates :content, presence: true, length: { maximum: 8000 }
end
