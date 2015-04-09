source 'https://rubygems.org'

ruby '2.1.1'
gem 'rails', '3.2.18'

group :development, :test do
  gem 'sqlite3'
end

gem 'sass'
gem 'sass-rails',   '~> 3.2.3'
gem 'coffee-rails', '~> 3.2.1'
gem 'uglifier', '>= 1.0.3'

gem 'underscore-rails'
gem 'angularjs-rails'
gem 'ng-rails-csrf'
gem 'angular-ui-bootstrap-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails', "~>4.2.1"
gem 'jbuilder', '~> 1.2'
gem 'htmlentities'
gem 'bootstrap-sass', '>= 3.0.0.0'
gem 'bootstrap-datepicker-rails'
gem 'figaro'
gem 'restforce'
gem 'momentjs-rails'
gem 'fog'

gem 'rack-ssl'
gem 'sidekiq', '2.17.7'
gem 'sinatra', require: false
gem "ruby-pardot", :git => "https://github.com/Pardot/ruby-pardot"

gem "font-awesome-rails"
gem "erubis"

gem 'newrelic_rpm'
gem 'unicorn'
gem "rack-timeout"
# gem "galetahub-simple_captcha", :require => "simple_captcha"
gem 'simple_captcha2', :require => "simple_captcha"

#For Generating PDFs
gem 'wkhtmltopdf-binary'
gem 'wicked_pdf'

group :development do
	gem 'debugger'
	gem 'awesome_print'
	gem 'pry-rails'
end

# for SOAP APIs
gem 'savon', '~> 2.0.2'

group :test do
	gem 'rspec-rails'
  gem 'webmock'
end

group :production, :staging do
	gem 'pg'
  gem 'rails_12factor'
  gem 'heroku-deflater', '~> 0.5.2'
end

gem 'rack-canonical-host'
gem 'canonical-rails', '~> 0.0.7'

# Refinery CMS
gem 'refinerycms', '~> 2.1.0'
gem 'refinerycms-acts-as-indexed', '~> 1.0.0'
gem 'refinerycms-search', '~> 2.1.0'
gem 'refinerycms-blog', '~> 2.1.0'
#gem 'refinerycms-tags', '~>1.0.3'
#  gem 'refinerycms-blog', '~> 2.1.0'
#  gem 'refinerycms-inquiries', '~> 2.1.0'
#  gem 'refinerycms-search', '~> 2.1.0'
#  gem 'refinerycms-page-images', '~> 2.1.0'
gem 'refinerycms-page_texts', :path => 'vendor/extensions'

gem 'refinerycms-people', :path => 'vendor/extensions'
gem 'refinerycms-media', :path => 'vendor/extensions'
gem 'refinerycms-qas', :path => 'vendor/extensions'
gem 'refinerycms-press_releases', :path => 'vendor/extensions'

gem 'bootstrap-sass', '>= 3.0.0.0'
gem 'bootstrap-datepicker-rails'