# frozen_string_literal: true

class PageService
  def initialize(page:)
    @page = page
  end

  def executing_create
    Page.create!(@page)
  end

  private

  attr_accessor :page
end
