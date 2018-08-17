class LoansController < ApplicationController
  def index
    @checkout_loans = @current_user.checkout_loans
  end
end
