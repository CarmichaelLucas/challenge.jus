# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def page_params
    params.require(:page).permit(:number, :content)
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
