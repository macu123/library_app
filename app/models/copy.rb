class Copy < ApplicationRecord
  belongs_to :book
  has_many :loans

  def available?
    self.available
  end

  def checkout_by(user)
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
    current_loan.user if current_loan
  end

  def checkin
    current_loan.update(checkin_date: Date.today)
    self.update(available: true)
  end
end
