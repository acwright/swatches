require File.dirname(__FILE__) + '/bootstrap.rb'

class Swatches < Sinatra::Base
  
  configure do
    set :root,    File.dirname(__FILE__)
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
  post '/swatches/:name/:color/?' do
    Swatch.create(:name => params[:name], :color => params[:color])
  end
  
  # Destroy
  delete '/swatches/:id' do
    begin
      Swatch.find(params[:id]).destroy
    rescue
      status 404
    end
  end
end