class LoansController < ApplicationController
  def index
    @checkout_loans = @current_user.checkout_loans
  end

  def checkin
    loan = Loan.find(params[:id])
    loan.checkin
    redirect_to loans_url, notice: 'It has been returned successfully!'
  end
end
