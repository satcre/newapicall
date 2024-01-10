require "functions_framework"

FunctionsFramework.http "send_post_request" do |request|
  require "net/http"
  require "json"

  payload = JSON.parse(request.body.read)
  
  api_url = "https://staging-sendselly.buddyandselly.com/sendin/api/v1/purchase_requests"
  api_key = "13336be6-71f7-4e56-b265-c68044b1e8ad"

  uri = URI(api_url)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = uri.scheme == "https"

  http_request = Net::HTTP::Post.new(uri)
  http_request["Content-Type"] = "application/json"
  http_request["Authorization"] = api_key
  http_request.body = payload.to_json

  response = http.request(http_request)

  response
end
