# frozen_string_literal: true

source "https://rubygems.org"
#gemspec

gem "jekyll", "~> 4.2.0"
gem 'jekyll-admin', group: :jekyll_plugins

gem "logger"
gem "base64"
gem "bigdecimal"
gem "ostruct"
gem "rexml"
gem "csv"
gem "webrick", "~> 1.7"

gem "rack", "~> 2.2"
gem "rack-protection", "~> 2.0"

gem "sinatra", "~> 2.0"
gem "sinatra-contrib", "~> 2.0"

#gem 'rack', require: false
#gem 'rack-protection', require: false

gem "kramdown", "~> 2.3"

# This gem for efficient file watching on Windows
gem 'wdm', '>= 0.1.0', :platforms => [:mswin, :mingw]

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.6"
  gem "jekyll-paginate", "~> 1.1.0"
end

require 'rbconfig'
  if RbConfig::CONFIG['target_os'] =~ /darwin(1[0-3])/i
    gem 'rb-fsevent', '<= 0.9.4'
  end
