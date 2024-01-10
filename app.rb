# app.rb
require 'functions_framework'
require 'net/http'
require 'uri'
require 'json'

FunctionsFramework.http 'call_new_api' do |request|
  uri = URI('https://jsonplaceholder.typicode.com/posts')
  response = Net::HTTP.get(uri)
  { status: 200, content_type: 'application/json', body: JSON.generate({ data: response }) }
end
