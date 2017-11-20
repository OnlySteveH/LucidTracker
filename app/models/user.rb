class User < ApplicationRecord
  has_secure_password
  has_many :sessions

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w\.\-\+]+@[a-z\d\-]+(\.[\a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       length: { minimum: 6 }

  before_save { email.downcase! }
end
