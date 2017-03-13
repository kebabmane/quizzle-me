Apipie.configure do |config|
  config.app_name                = "quizzle.me"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/admin/api_doc"
  config.validate                = false
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
