class SessionsController < ApplicationController
  def createLender
    user = Lender.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/lenders/#{user.id}"
    else
      flash[:error] = "Invalid email or password"
      redirect_to "/sessions/lenders/login"
    end
  end

  def createBorrower
    user = Borrower.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/borrowers/#{user.id}"
    else
      flash[:error] = "Invalid email or password"
      redirect_to "/sessions/borrowers/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/user"
  end

  def indexLender
  end

  def indexBorrower
  end
end
