class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, length:{maximum: 50}
  has_secure_password
  validates :password, length: {minimum: 6}
end
