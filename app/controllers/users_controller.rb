class UsersController < ApplicationController
	before_action :current_user, only:[:edit, :update, :destroy]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	
# ------------------------------------------------
	def users_profile
	end

	def update_user_page
		@user = current_user
	end

	def users_profile 

	end

	def create
		vet = Vet.new(vet_params)
		address = Address.new(street:params[:street_update], city:params[:city_update], state:params[:state_update], zip:params[:zip_update])
	    user = User.new(user_params)
<<<<<<< HEAD
	      if user.save && address.save
	        session[:lender_id] = lender.id
	        redirect_to "/users/profile/#{user.id}"
=======
	      if  address.save
	      	user.address_id = address.id
	      	user.save
	        session[:user_id] = user.id
	        redirect_to "/user/profile"
	    elsif  address.save
	      	vet.address_id = vet.id
	      	vet.save
	        session[:vet_id] = vet.id
	        redirect_to "/vet/profile"
>>>>>>> origin/master
	      else
	        flash[:error] = lender.errors.full_messages
	        redirect_to :back
	     end
	  end

# the users parameters are wrong since we havent set how to find the specific user yet
	def update_user
		user_update = User.find(params[:user_id]).update(first_name:params[:first_name_update], last_name:params[:last_name_update], email:params[:email_update])
		address_update = Address.find().update(street:params[:street_update], city:params[:city_update], state:params[:state_update], zip:params[:zip_update])

		# redirect to the main user page which is not set yet
		redirect_to '' 
	end

# ------------------------------------------------

	def update_vet_page
		@user = current_user
	end

# the address parameters are wrong since we havent set how to find the specific addresses yet
	def update_vet
		vet_update = Vet.find().update(first_name:params[:vet_first_name_update], last_name:params[:vet_last_name_update], email:params[:vet_email_update])
		vet_address_update = Address.update(street:params[:vet_street_update], city:params[:vet_city_update], state:params[:vet_state_update], zip:params[:vet_zip_update])
	end


	private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, ) 
  end

  	private
  def vet_params
    params.require(:user).permit(:first_name, :last_name, :office_name, :email, :password) 
  end

end
