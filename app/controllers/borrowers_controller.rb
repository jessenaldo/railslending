class BorrowersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    borrower = Borrower.find(current_borrower.id)
    @lenders = borrower.lenders.group("lenders.id")
  end

  private

  def set_user
    @user = Borrower.find(params[:id])
  end
end
