source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'bootsnap', require: false
gem 'importmap-rails'
gem 'jbuilder'
gem 'octokit'
gem 'pg', '~> 1.4', '>= 1.4.3'
gem 'puma', '~> 5.6'
gem 'rack-oauth2'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'redis', '~> 4.0'
gem 'sequent', github: 'zilverline/sequent'
gem 'sprockets-rails' # not sure if we need this?
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bcrypt', '~> 3.1', '>= 3.1.12'
gem 'jwt', '~> 2.5'
gem 'rack-cors'
gem "cancancan"

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem "byebug"
  gem 'rspec-rails'
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'rspec'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
end
