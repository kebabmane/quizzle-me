Gaffe.configure do |config|
  config.errors_controller = {
    %r[^/api/] => 'Api::ApiErrorsController',
    %r[^/] => 'ErrorsController'
  }
end

Gaffe.enable!
