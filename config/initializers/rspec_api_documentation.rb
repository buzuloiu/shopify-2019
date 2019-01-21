# config/initializers/rspec_api_documentation.rb
RspecApiDocumentation.configure do |config|
  # Output folder
  config.docs_dir = Rails.root.join("doc", "api")

  # An array of output format(s).
  # Possible values are :json, :html, :combined_text, :combined_json,
  #   :json_iodocs, :textile, :markdown, :append_json
  config.format = [:json]

  # Change the name of the API on index pages
  config.api_name = "API Documentation"

end
