require 'net/http'

module HubSpot
  module HTTP
    DEFAULT_HEADERS = {
      :accept => 'application/json',
      :content_type => 'application/x-www-form-urlencoded;charset=utf-8',      
    }

    module_function
    def post(url:, post_body: nil, headers: DEFAULT_HEADERS)
      uri = URI(url)
      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        request = Net::HTTP::Post.new(uri.request_uri, headers)
        request.body = post_body.to_json unless post_body.nil?

        # Send the request
        response = http.request(request)
      end
    end
  end
end
