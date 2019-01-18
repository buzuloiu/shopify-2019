Rack::Defense.setup do |config|
  config.throttle('api', 100, 1000) do |req|
    req.env['HTTP_AUTHORIZATION'] if %r{^/api/} =~ req.path
  end

  config.throttled_response =
    ->(env) { [429, {'Content-Type' => 'text/plain'}, ["Too many requests. Please try again later.\n"]] }
end
