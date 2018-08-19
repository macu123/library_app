class Copy < ApplicationRecord
  belongs_to :book
  has_many :loans

  def book_title
    book.title
  end

  def book_author
    book.author
  end

  def book_genre
    book.genre
  end

  def book_sub_genre
    book.sub_genre
  end

  def book_num_of_pages
    book.num_of_pages
  end

  def book_publisher
    book.publisher
  end

  def available?
    self.available
  end

  def checkout_by(user)
    return false unless self.available?

    loans.create(
      user_id: user.id,
      checkout_date: Date.today,
      due_date: 1.week.from_now.to_date
    )
    self.update(available: false)
  end

  def current_loan
    loans.where(
        'checkout_date IS NOT NULL AND checkin_date IS NULL'
      ).first
  end

  def borrower 
    current_loan.try(:user)
  end

  def checkin
    return false if self.available?

    current_loan.update(checkin_date: Date.today)
    self.update(available: true)
  end
end
