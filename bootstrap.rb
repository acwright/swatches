require 'rubygems'
require 'bundler'

ENV['RACK_ENV'] ||= 'development'

Bundler.require(:default)

Dir["#{File.dirname(__FILE__)}/lib/**/*.rb"].each { |f| require(f) }

Mongoid.load!(File.dirname(__FILE__) + '/mongoid.yml')