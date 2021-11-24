# frozen_string_literal: true

require 'sidekiq/web'

# Configure Sidekiq-specific session middleware
Sidekiq::Web.use ActionDispatch::Cookies
Sidekiq::Web.use ActionDispatch::Session::CookieStore, key: '_interslice_session'

Rails.application.routes.draw do
  resources :articles, only: %i[index show create]

  # mount Sidekiq::Web in your Rails app
  mount Sidekiq::Web => '/sidekiq'
end
