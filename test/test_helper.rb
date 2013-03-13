require 'rubygems'
require 'bundler'
require 'rspec'
Bundler.setup
 
require 'shoulda'
require 'parser_xcel'

ENV['RAILS_ENV'] = 'test'
require "dummy/config/environment"
require "rails/test_help"
