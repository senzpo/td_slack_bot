# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.1'

gem 'rails', '~> 7.0.5'

gem 'bootsnap', require: false
gem 'bootstrap', '~> 5.3.0.alpha3'
gem 'business', '~> 2.0'
gem 'clockwork'
gem 'dotenv'
gem 'gitlab'
gem 'google_sign_in'
gem 'importmap-rails'
gem 'jbuilder'
gem 'kaminari'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'ransack'
gem 'redis', '~> 4.0'
gem 'slack-ruby-client'
gem 'slim'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tinybucket'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'clockwork-test'
end
