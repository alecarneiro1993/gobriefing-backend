# frozen_string_literal: true

class Api::SessionsController < ApplicationController
  def authenticate
    @response = Sessions::Authenticate.call(email: params[:email],
                                            password: params[:password])
  end
end
