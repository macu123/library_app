class User < ApplicationRecord
  has_many :loans

  has_secure_password

  validates :email, presence: true, uniqueness: true

  def admin?
    self.admin
  end
  
  def checkout_loans
    loans.where('checkout_date IS NOT NULL AND checkin_date IS NULL')
  end
end
