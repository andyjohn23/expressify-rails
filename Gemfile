source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby "3.1.2"
#used for serialization of active models
#uploading images to cloudinary

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "jwt"
gem "puma", "~> 5.0"
gem "rack-cors"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "shrine-cloudinary"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'active_model_serializers'
gem 'pg', '~> 1.4', '>= 1.4.2'

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
end

group :development do
end

