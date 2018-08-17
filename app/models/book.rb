class Book < ApplicationRecord
  has_many :copies

  validates :title, presence: true

  def available_copies
    copies.where(available: true)
  end

  def available?
    available_copies.count > 0
  end

  def add_copy
    copies.create
  end

  def checkout_by(user)
    copy = available_copies.first
    copy.checkout_by(user)
  end
end
