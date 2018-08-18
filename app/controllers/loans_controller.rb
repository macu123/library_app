class LoansController < ApplicationController
  def index
    @current_loans = @current_user.current_loans
  end

  def checkin
    loan = Loan.find(params[:id])
    loan.checkin
    redirect_to loans_url, notice: 'It has been returned successfully!'
  end
end
