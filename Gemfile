source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '3.1.11'
gem 'coffee-rails', '4.2.2'
gem 'jbuilder', '2.7.0'
gem 'puma', '3.10.0'
gem 'rails', '5.1.4'
gem 'sass-rails', '5.0.6'
gem 'sqlite3', '1.3.13'
gem 'turbolinks', '5.0.1'
gem 'uglifier', '3.2.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '2.15.4'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '3.1.5'
  gem 'spring'
  gem 'spring-watcher-listen', '2.0.1'
  gem 'web-console', '3.5.1'
end

group :test do
  gem 'minitest-reporters', '1.1.18'
  gem 'rails-controller-testing', '1.0.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
