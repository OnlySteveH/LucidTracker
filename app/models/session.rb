class Session < ApplicationRecord
  belongs_to :user

  def match?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST
                                                  : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
  end
end
