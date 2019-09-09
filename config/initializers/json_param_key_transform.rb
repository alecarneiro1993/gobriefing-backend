# frozen_string_literal: true

# File: config/initializers/json_param_key_transform.rb
# Transform JSON request param keys from JSON-conventional camelCase to
# Rails-conventional snake_case:
ActionDispatch::Request.parameter_parsers[:json] = -> (raw_post) {
  # Modified from action_dispatch/http/parameters.rb
  data = ActiveSupport::JSON.decode(raw_post)
  data = { _json: data } unless data.is_a?(Hash)

  # Transform camelCase param keys to snake_case:
  data.transform_keys!(&:underscore)
}

ActionDispatch::Response.parameter_parsers[:json] = -> (raw_post) {
  # Modified from action_dispatch/http/parameters.rb
  data = ActiveSupport::JSON.decode(raw_post)
  data = { _json: data } unless data.is_a?(Hash)

  # Transform snake_case param keys to camelCase:
  data.transform_keys!(&:camelize)
}
