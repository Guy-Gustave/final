if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_final', domain: 'final-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_final'
end
