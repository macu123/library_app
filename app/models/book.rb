class Book < ApplicationRecord
  has_many :copies

  def available?
    copies.where(available: true).count > 0
  end

  def add_copies(num_of_copies)
    num_of_copies.times do 
      copies.create
    end
  end
end
