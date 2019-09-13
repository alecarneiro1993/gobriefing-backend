# frozen_string_literal: true

class UsersController < ApplicationController
  def create
    @response = Users::Create.call(params: params)
  end
end
