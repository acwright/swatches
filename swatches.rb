require 'rubygems'
require 'bundler'

ENV['RACK_ENV'] ||= 'development'

Bundler.require(:default)

class Swatch
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :color,  type: String
  field :name,   type: String
end

configure do
  set :root,    File.dirname(__FILE__)
  
  Mongoid.load!(File.dirname(__FILE__) + '/mongoid.yml')
end

before '*' do
  content_type :json
end

get '/' do
  redirect to('/swatches')
end

# Index
get '/swatches/?' do
  Swatch.all.to_json
end

# Find
get '/swatches/:id/?' do
  begin
    Swatch.find(params[:id]).to_json
  rescue
    status 404
  end
end

# Create
post '/swatches/?' do
  Swatch.create(JSON.parse(request.body.read))
end

# Destroy
delete '/swatches/:id' do
  begin
    Swatch.find(params[:id]).destroy
  rescue
    status 404
  end
end