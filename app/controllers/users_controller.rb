class UsersController < ApplicationController
	before_action :current_user, only:[:edit, :update, :destroy]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	
# ------------------------------------------------
	def users_profile
	end

	def update_user_page
		@user = current_user
		@address = Address.find(current_user.id)
	end

	def users_profile 
		@user = User.joins(:address).select("first_name", "last_name", "street", "state", "city", "zip", "avatar_file_name", "avatar_content_type", "avatar_file_size", "avatar_updated_at").find(current_user.id)
		@pets = Pet.where("user_id = #{current_user.id}")
	end

	def vet_profile 
		@vet = Vet.find(params[:id])
		@clients = User.joins(:address).select("first_name", "last_name", "email", "address_id as U_address", :street, :city, :state, :zip)
		@pet = Pet.joins(:user).select("name", "sex", "species", "age", "user_id as owner", :first_name,  :last_name)
	end

	def create_vet
		vet = Vet.new(vet_params)
		address = Address.new(address_params)
    if  vet && address.save
      	vet.address_id = address.id
      	vet.save
        session[:vet_id] = vet.id
        redirect_to "/vets/#{vet.id}"
     else
        flash[:error] = vet.errors.full_messages
        redirect_to :back
    end
	end

	def create_user
		user = User.new(user_params)
		address = Address.new(address_params)
    if user && address.save
    	user.address_id = address.id
    	user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:error] = user.errors.full_messages
      redirect_to :back
   end
  end

# the users parameters are wrong since we havent set how to find the specific user yet
	def update_user
		u = User.find(current_user.id)
		u.update(first_name:params[:first_name_update], last_name:params[:last_name_update], email:params[:email_update]) 
		a = Address.find(current_user.id)
		a.update(street:params[:street_update], city:params[:city_update], state:params[:state_update], zip:params[:zip_update])
		if a.valid? && u.valid?
			a.save && u.save
			redirect_to '/users/#{current_user.id}' 
		else 
			flash[:owner_err] = a.errors.full_messages && u.errors.full_messages
			redirect_to :back
		end
			
	end

	def update_user_pic
		if params[:avatar]
			User.find(current_user.id).update(avatar: params[:avatar])
			redirect_to "/users/#{current_user.id}"
		else
			redirect_to "/users/#{current_user.id}"
		end
	end
# ------------------------------------------------

	def update_vet_page
		
	end

	def vet_show
		@vet = Vet.joins(:address).select("first_name", "last_name","email","office_name", "street", "state", "city", "zip").find(params[:id])
		
	end
# the address parameters are wrong since we havent set how to find the specific addresses yet
	def update_vet
		vet_update = Vet.find().update(first_name:params[:vet_first_name_update], last_name:params[:vet_last_name_update], email:params[:vet_email_update])
		vet_address_update = Address.update(street:params[:vet_street_update], city:params[:vet_city_update], state:params[:vet_state_update], zip:params[:vet_zip_update])
	end


	private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar) 
  end

  	private
  def vet_params
    params.require(:vet).permit(:first_name, :last_name, :office_name, :email, :password) 
  end

   	private
  def address_params
    params.require(:address).permit(:street, :city, :state, :zip) 
  end
end
