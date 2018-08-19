class Loan < ApplicationRecord
  belongs_to :user
  belongs_to :copy

  validates :checkout_date, :due_date, presence: true

  def book_title
    copy.book.title
  end

  def book_author
    copy.book.author
  end

  def book_genre
    copy.book.genre
  end

  def book_sub_genre
    copy.book.sub_genre
  end

  def book_num_of_pages
    copy.book.num_of_pages
  end

  def book_publisher
    copy.book.publisher
  end

  def checkin
    copy.checkin
  end
end
