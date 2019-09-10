# frozen_string_literal: true

class JsonWebToken
  class << self
    def encode(payload)
      key = Rails.application.credentials.secret_key_base
      JWT.encode(payload, key)
    end

    def decode(token)
      key = Rails.application.credentials.secret_key_base
      JWT.decode(token, key)
    end
  end
end
