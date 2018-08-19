class LoansController < ApplicationController
  def index
    @current_loans = @current_user.current_loans
  end

  def checkin
    loan = Loan.find(params[:id])
    if loan.checkin
      redirect_to loans_url, notice: 'It has been returned successfully!'
    else
      redirect_to loans_url, alert: 'It cannot be returned now!'
    end
  end
end
