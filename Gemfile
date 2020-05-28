source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2.3"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.11"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "jbuilder", "~> 2.5"
gem "bootsnap", ">= 1.1.0", require: false
gem "bcrypt", "~> 3.1", ">= 3.1.12"
gem "jwt", "~> 1.5", ">= 1.5.4"
gem "config", "~> 2.0"
gem "dotenv-rails", "~> 2.1", ">= 2.1.1"
gem "rack-cors", "~> 1.1.0", require: "rack/cors"
gem "kaminari", "~> 1.2.1"

# upload image
gem "carrierwave", "~> 1.2.3"
gem "file_validators", "~> 2.3.0"
gem "mimetype-fu", "~> 0.1.2"
gem "mini_magick", "4.8.0"

group :development, :test do
  gem "pry-rails", "~> 0.3.6"
  gem "ffaker", "~> 2.13.0"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
