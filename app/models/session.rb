class Session < ApplicationRecord
  belongs_to :user

  def match?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
