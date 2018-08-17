class Book < ApplicationRecord
  has_many :copies

  def available_copies
    copies.where(available: true)
  end

  def available?
    available_copies.count > 0
  end

  def add_copies(num_of_copies)
    num_of_copies.times do 
      copies.create
    end
  end

  def checkout_by(user)
    copy = available_copies.first
    copy.checkout_by(user)
  end
end
