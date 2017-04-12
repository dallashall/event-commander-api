class User < ApplicationRecord
  attr_reader :password
  validates :username, :email, presence: true, uniqueness: true
  valdiates :password_digest, presence: true
  validates :password, length: { minimum: 8, allow_nil: true }

  def gen_auth_token
    token = SecureRandom.urlsafe_base64
    self.update_columns(auth_token: token)
    token
  end

  def invalidate_token
    self.update_columns(auth_token: token)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
