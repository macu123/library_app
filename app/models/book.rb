class Book < ApplicationRecord
  has_many :copies

  def available?
    copies.where(available: true).count > 0
  end
end
