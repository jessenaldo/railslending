class UserController < ApplicationController

  def index
  end

  def createLender
    user = Lender.new(lender_params)
    user.save
    if user.errors.any?
      flash[:lender_errors] = user.errors.full_messages
      redirect_to "/user"
    else
      session[:user_id] = user.id
      redirect_to "/lenders/#{user.id}"
    end
  end

  def createBorrower
    user = Borrower.new(borrower_params)
    user.save
    if user.errors.any?
      flash[:borrower_errors] = user.errors.full_messages
      redirect_to "/user"
    else
      session[:user_id] = user.id
      redirect_to "/borrowers/#{user.id}"
    end
  end

  private

  def lender_params
    params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation, :balance )
  end

  def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :title, :description, :amountneed)
  end
end
