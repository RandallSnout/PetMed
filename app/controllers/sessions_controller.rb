class SessionsController < ApplicationController

  def new
  end

  def vet_new
  end
  
  def login
		@user = User.find_by_email(params[:email]) 
		@vet = Vet.find_by_email(params[:email]) 
		if @user 
			@user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		elsif @vet
			@vet && @vet.authenticate(params[:password])
			session[:vet_id] = @vet.id
			redirect_to "/vets/#{@vet.id}"
		else
			flash[:error] = "Invalid Login"
			redirect_to :back
		end
	end


  def destroy
		reset_session
    	redirect_to "/"
  end




end
