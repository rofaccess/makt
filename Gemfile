source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.7"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[mri mingw x64_mingw]

  # RSpec for Rails 5+ [https://github.com/rspec/rspec-rails]
  gem "rspec-rails", "~> 6.0.0"

  # A library for generating fake data such as names, addresses, and phone numbers [https://github.com/faker-ruby/faker]
  gem "faker"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # A Ruby language server [https://github.com/castwide/solargraph]
  gem "solargraph"

  # A normaliser/beautifier for HTML that also understands embedded Ruby. Ideal for tidying up Rails templates [https://github.com/threedaymonk/htmlbeautifier]
  gem "htmlbeautifier"
end

group :test do
  # Code coverage for Ruby with a powerful configuration library and automatic merging of coverage across test suites [https://github.com/simplecov-ruby/simplecov]
  gem "simplecov", require: false

  # Simplecov Output of HTML using Tailwind UX design [https://github.com/chiefpansancolt/simplecov-tailwindcss]
  gem "simplecov-tailwindcss", require: false

  # Acceptance test framework for web applications [https://github.com/teamcapybara/capybara]
  gem "capybara"
end

# A Ruby static code analyzer and formatter, based on the community Ruby style guide [https://github.com/rubocop/rubocop]
gem "rubocop"

# Easily integrate Mazer admin theme in a Ruby on Rails app [https://github.com/noesya/mazer-rails]
gem "mazer-rails", "~> 0.2.0"

# Flexible authentication solution for Rails with Warden [https://github.com/heartcombo/devise]
gem "devise", "~> 4.9"

# A framework for building reusable, testable & encapsulated view components in Ruby on Rails [https://github.com/ViewComponent/view_component]
gem "view_component", "~> 3.6"
