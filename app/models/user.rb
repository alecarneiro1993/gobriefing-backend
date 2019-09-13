# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :nickname
  validates :email, uniqueness: { case_sensitive: false, message: "errors.users.email_uniqueness" },
                    format: { with: VALID_EMAIL_REGEX, message: "errors.users.invalid_email_format" }
  validates :password, length: { minimum: 6, message: "errors.users.min_password_length" },
                       confirmation: { message: "errors.users.passwords_match" }
end
