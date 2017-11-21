class User < ApplicationRecord
  has_secure_password
  attr_accessor :remember_token

  has_many :sessions, dependent: :destroy

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 10 }
  VALID_EMAIL_REGEX = /\A[\w\.\-\+]+@[a-z\d\-]+(\.[\a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true,
                       length: { minimum: 6 }

  before_save { email.downcase! }

  def authenticated?(remember_token)
    sessions.each { |session| return true if session.match? remember_token }
    false
  end

  def remember
    self.remember_token = Session.new_token
    sessions.create(remember_digest: Session.digest(remember_token))
    remember_token
  end

  def forget
    sessions.delete_all
  end
end
