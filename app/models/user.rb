class User < ApplicationRecord
  include DigestMatcher

  before_save :downcase_email
  before_create :create_activation_digest

  attr_accessor :remember_token, :activation_token
  has_secure_password
  has_many :sessions, dependent: :destroy

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w\.\-\+]+@[a-z\d\-]+(\.[\a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       length: { minimum: 6 }

  def remembered?(remember_token)
    sessions.each do |session|
      return true if session.match? :remember, remember_token
    end
    false
  end

  def remember
    self.remember_token = User.new_token
    sessions.create(remember_digest: User.digest(remember_token))
    remember_token # return remember token so that it can be saved in cookie
  end

  def forget
    sessions.delete_all
  end

  private

    def downcase_email
      email.downcase!
    end

    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST
                                                  : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end
