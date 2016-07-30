class LendersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
    @borrowers = Borrower.all

    lender = Lender.find(current_lender.id)
    @myborrowers = lender.borrowers.group("borrowers.id")
  end

  def create
    borrower = Borrower.find(params[:borrower])
    lender = Lender.find(current_lender.id)
    if lender.balance <= 0
      flash[:error] = "Insufficient funds"
      redirect_to "/lenders/#{current_lender.id}"
    elsif lender.balance < params[:amount].to_f
      flash[:error] = "Your balance is lower than the amount you requested to lend"
      redirect_to "/lenders/#{current_lender.id}"
    else
      transaction = Transaction.new(lender: Lender.find(current_lender.id), borrower: Borrower.find(params[:borrower]), amount: params[:amount].to_f)
      transaction.save
      if transaction.errors.any?
        flash[:errors] = transaction.errors.full_messages
        redirect_to "/lenders/#{current_lender.id}"
      else
        lender.balance = lender.balance - params[:amount].to_f
        lender.save
        borrower.amountraised = borrower.amountraised + params[:amount].to_f
        borrower.save
        redirect_to "/lenders/#{current_lender.id}"
      end
    end

  end

  private

  def set_user
    @user = Lender.find(params[:id])
  end
end
