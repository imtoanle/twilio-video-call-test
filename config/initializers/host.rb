host = 'http://localhost:3000'
host = Rails.application.credentials.dig(:domain_name) unless Rails.env.test? || Rails.env.development?

Rails.application.routes.default_url_options[:host] = host
