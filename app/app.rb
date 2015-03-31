require 'rubygems'
require 'sinatra'
require 'her'

# Configure Her
Her::API.setup :url => "https://api.github.com" do |c|
  c.use Faraday::Request::UrlEncoded
  c.use Her::Middleware::DefaultParseJSON
  c.use Faraday::Response::Logger, $logger
  c.use Faraday::Adapter::NetHttp
end

# Require models
Dir[File.expand_path('../../app/models/**/*.rb', __FILE__)].each do |file|
  dirname = File.dirname(file)
  file_basename = File.basename(file, File.extname(file))
  require "#{dirname}/#{file_basename}"
end

get '/' do
  erb :index
end

# GET /users
get '/users' do
  @users = User.all
  erb :'users/index'
end

# GET /users/:id
get '/users/:id' do
  @user = User.find(params[:id])

  erb :'user/show'
end



