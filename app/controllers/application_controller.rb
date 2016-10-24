class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    if session[:user_id]
      Lender.find(session[:user_id]) if session[:user_id]
    else
      Borrower.find(session[:vet_id]) if session[:vet_id]
    end
  end
  def require_correct_user
    if session[:user_id]
      user = Lender.find(params[:id])
      redirect_to "/lenders/#{current_user.id}" if current_user != user
    else
      user = Borrower.find(params[:id]) 
      redirect_to "/borrowers/#{current_user.id}" if current_user != user
    end
  end
  def require_login
    redirect_to '/sessions/new' if session[:user_id] == nil && session[:vet_id] == nil
  end
  helper_method :current_user
end
