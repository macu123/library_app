class User < ApplicationRecord
  has_many :loans

  has_secure_password

  validates :email, presence: true, uniqueness: true
end
