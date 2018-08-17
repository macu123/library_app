class Copy < ApplicationRecord
  belongs_to :book
  has_many :loans
end
