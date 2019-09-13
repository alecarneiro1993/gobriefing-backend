# frozen_string_literal: true

class Users::Create
  attr_reader :response

  def self.call(params:)
    service = new(params)
    service.call
    service.response
  end

  def initialize(params)
    @params = params
  end

  def call
    create
  end

  private
    def create
      # need to change this
      return @response = :unprocessable_entity unless params_valid?

      init_user
      return @response = format_error_response unless @user.valid?

      @user.save
      @response = format_success_response
    end

    def init_user
      @user = User.new(user_params)
      @user.password = @params[:password]
      @user.password_confirmation = @params[:password_confirmation]
    end

    def format_error_response
      error_messages = @user.errors.messages
      key = error_messages.keys.first
      { type: :error, label: error_messages[key].first, fields: [key] }
    end

    def format_success_response
      { type: :success, label: "requests.users.account_created" }
    end

    def params_valid?
      user_params.keys.all? { |key| !user_params[key].blank? }
    end

    def password_match?
      @params[:password] == @params[:password_confirmation]
    end

    def user_params
      @params.require(:user).permit(:first_name, :last_name, :nickname, :email)
    end
end
