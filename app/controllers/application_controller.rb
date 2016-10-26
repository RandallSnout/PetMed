class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    def current_user
    if session[:user_id]
      User.find(session[:user_id]) 
    elsif session[:vet_id]
      Vet.find(session[:vet_id])
    end
  end

  def check_phone
      session[:check_if_phone_is_blank] = false
  end

  def require_login
    redirect_to '/' if session[:user_id] == nil
  end

   helper_method :current_user

  def require_correct_user
    if 
      user = User.find(params[:id])
    else 
      user = Vet.find(params[:id]) 
    end
    redirect_to "/sessions/#{current_user.id}" if current_user != user
  end
  
  protect_from_forgery with: :exception
  
  def current_user
    if session[:user_id]
      User.find(session[:user_id]) if session[:user_id]
    else
      Vet.find(session[:vet_id]) if session[:vet_id]
    end
  end
  def require_correct_user
    if session[:user_id]
      user = User.find(params[:id])
      redirect_to "/user/#{current_user.id}" if current_user != user
    else
      user = Vet.find(params[:id]) 
      redirect_to "/vet/#{current_user.id}" if current_user != user
    end
  end
  def require_login
    redirect_to '/sessions/new' if session[:user_id] == nil && session[:vet_id] == nil
  end
  helper_method :current_user
end
