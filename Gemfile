source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "rails", "~> 5.1.2"
gem "bootstrap", "~> 4.0.0.beta"
gem "bcrypt",         "3.1.11"
gem "jquery-rails"
gem "sqlite3"
gem "turbolinks", "5.0.1"
gem "faker", "1.7.3"
gem "config"
gem "puma", "~> 3.7"
gem "carrierwave",             "1.1.0"
gem "mini_magick",             "4.7.0"
gem "ckeditor"
gem "fog",                     "1.40.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jbuilder", "~> 2.5"
gem "bootstrap-datepicker-rails"
gem 'will_paginate', '~> 3.1.0'
group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "capybara", "~> 2.13"
  gem "selenium-webdriver"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
