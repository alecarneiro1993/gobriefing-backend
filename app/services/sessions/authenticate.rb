# frozen_string_literal: true

class Sessions::Authenticate
  attr_reader :response

  def self.call(email:, password:)
    service = new(email, password)
    service.call
    service.response
  end

  def initialize(email, password)
    @email = email
    @password = password
   end

  def call
    authenticate
  end

  private
    def authenticate
      return @response = :unauthorized unless correct_credentials?
      payload = { id: @user.id, email: @email }
      @response = JsonWebToken.encode(payload)
    end

    def correct_credentials?
      @user = User.find_by(email: @email)
      @user && @user.authenticate(@password)
    end
end
