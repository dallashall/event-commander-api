class User < ApplicationRecord
  attr_reader :password
  validates :username, :email, presence: true, uniqueness: true
  valdiates :password_digest, presence: true
  validates :password, length: { minimum: 8, allow_nil: true }

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
