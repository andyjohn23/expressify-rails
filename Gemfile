source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "3.1.2"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "jbuilder"
gem "jwt"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "shrine-cloudinary"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'active_model_serializers'
gem 'image_processing', '~> 1.12', '>= 1.12.2'
gem 'pg', '~> 1.4', '>= 1.4.2'
gem 'pgcrypto', '~> 0.4.1'
gem 'shrine', '~> 3.4'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
end

group :development do
  gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'
end

group :production do
  gem 'pg'
  gem 'pgcrypto', '~> 0.4.1'
end

