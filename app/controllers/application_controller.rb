class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    redirect_to "/user" if session[:user_id] = nil
  end

  def require_correct_lender
    lender = Lender.find(params[:id])
    redirect_to "/lenders/#{current_lender.id}" if current_lender != lender
  end

  def require_correct_borrower
    borrower = Borrower.find(params[:id])
    redirect_to "/borrowers/#{current_borrower.id}" if current_borrower != borrower
  end

  def current_lender
    Lender.find(session[:user_id]) if session[:user_id]
  end
  def current_borrower
    Borrower.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_lender
  helper_method :current_borrower
end
