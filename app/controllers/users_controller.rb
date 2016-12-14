class UsersController < ApplicationController
	before_action :current_user, only:[:edit, :update, :destroy]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	
# ------------------------------------------------

	def redirect
	  @user = User.find(params[:id]) 
	  if @user
		redirect_to "/users/#{@user.id}"
      end
	end

	def users_profile 
		@user = User.joins(:address).select("first_name", "last_name","phone_number", "street", "state", "city", "zip", "avatar_file_name").find(current_user.id)
		@pets = Pet.where("user_id = #{current_user.id}")
		@a = Vet.joins(:users, :address).select("vets.id as VETS_ID", "vets.first_name as VETS_FN","vets.last_name as VETS_LN", "vets.email", "users.id as USER_ID", "users.first_name as USERS_FN", "users.last_name as USERS_LN", :street, :city, :state, :city).where("users.id == #{current_user.id}")
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

	def update_user_page
		if !session[:phone]
			session[:phone] = 0
		end
		@pets = Pet.where("user_id = #{current_user.id}")
		@user = current_user
		@address = Address.find(current_user.id)
	end

	def update_user
		if !params[:phone_number_update].empty?
			u = User.find(current_user.id)
			u.update(first_name:params[:first_name_update], last_name:params[:last_name_update], email:params[:email_update], phone_number:params[:phone_number_update]) 
			a = Address.find(User.find(current_user.id).address_id)
			a.update(street:params[:street_update], city:params[:city_update], state:params[:state_update], zip:params[:zip_update])
			if a.valid? && u.valid?
				a.save && u.save
				redirect_to "/users/#{current_user.id}"
			else 
				flash[:owner_err] = a.errors.full_messages && u.errors.full_messages
				redirect_to :back
			end	
		elsif session[:phone] == 0 && params[:phone_number_update].empty?
			flash[:are_you_sure] = "You vet will be able to contact you more better if you give you phone number.  Are you sure you wanna continyou?"
			session[:phone] = 1
			redirect_to :back
		elsif session[:phone] == 1
			u = User.find(current_user.id)
			u.update(first_name:params[:first_name_update], last_name:params[:last_name_update], email:params[:email_update], phone_number:params[:phone_number_update]) 
			a = Address.find(User.find(current_user.id).address_id)
			a.update(street:params[:street_update], city:params[:city_update], state:params[:state_update], zip:params[:zip_update])
			if a.valid? && u.valid?
				a.save
				u.save
				session[:phone] = 0
				redirect_to "/users/#{current_user.id}"
			else 
				flash[:owner_err] = a.errors.full_messages && u.errors.full_messages
				redirect_to :back
			end	
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

	def change_vet
		User.find(current_user.id).update(vet_id:params[:id])
		redirect_to :back
	end
# ------------------------------------------------
	
	def vet_redirect
		@vet = Vet.find(params[:id])
		if @vet 
		redirect_to "/vets/#{@vet.id}"
		end
	end

	def vet_profile 
		@vet = Vet.joins(:address).select("vets.id as id", "first_name", "last_name","email", "phone_number", "office_name", "street", "state", "city", "zip", "avatar_file_name").find(params[:id])
		@clients = User.joins(:address).select("users.id as id", "first_name", "last_name", "phone_number", "email", "address_id as U_address", :street, :city, :state, :zip).where("vet_id = #{params[:id]}")
		@pets = Pet.select("id", "name", "user_id as owner").all
	end

	def create_vet
		vet = Vet.new(vet_params)
		address = Address.new(address_params)
    	if  vet.valid? && address.valid?
      		vet.save
      		address.save
      		vet.update(address_id:address.id)
        	session[:vet_id] = vet.id
        	redirect_to "/vets/#{vet.id}"
     	else
        	flash[:error] = vet.errors.full_messages
        	redirect_to :back
    	end	
	end

	def update_vet_page
		@vet = Vet.joins(:address).select("vets.id as id", "first_name", "last_name","phone_number", "email","office_name", "street", "state", "city", "zip", "avatar_file_name").find(params[:id])
	end

	def vet_show
		@vet = Vet.joins(:address).select("first_name", "last_name","email","phone_number", "office_name", "street", "state", "city", "zip", "avatar_file_name").find(params[:id])
		@vet_profile = Vet.find(params[:id])
	end


	def update_vet
		doc =  Vet.find(current_user.id)
		vet_add = Address.find(Vet.find(current_user.id).address_id)
		doc.update(first_name:params[:first_name], last_name:params[:last_name], email:params[:email_update], phone_number:params[:phone_number], office_name:params[:office_name])

		vet_add.update(street:params[:vet_street_update], city:params[:vet_city_update], state:params[:vet_state_update], zip:params[:vet_zip_update])

		if doc.valid? && vet_add.valid?
			if params[:avatar]
				Vet.find(params[:id]).update(avatar: params[:avatar])
				doc.save
				vet_add.save
				redirect_to "/vets/#{doc.id}"
			else
				doc.save
				vet_add.save
				redirect_to "/vets/#{doc.id}"
			end
		else
			flash[:vet_err] = doc.errors.full_messages
			flash[:vet_add_err] = vet_add.errors.full_messages
			redirect_to :back
		end
	end

	def update_vet_pic
		if params[:avatar]
			Vet.find(params[:id]).update(avatar: params[:avatar])
			redirect_to "/vets/#{current_user.id}"
		else
			redirect_to "/vets/#{current_user.id}"
		end
	end

	def vet_input
		@pet = Pet.find(params[:id])
		@vet = Vet.find(current_user.id)
		@rec = Pet.joins(:record).select("fixed","allergy", "behavior", "records.pet_id as pet_rec_id").find_by("pet_id = #{@pet.id}")
		@shot = Shot.where("pet_id = #{@pet.id}").first
		@comments = Vet.joins(:comments).select("note", "first_name", "last_name", "comments.created_at", "pet_id").where("pet_id = #{params[:id]}")
	end

	def notes
		@vet =  Vet.find(current_user.id)
		@pet = Pet.find(params[:id])
			note = Comment.new(note: params[:comment], vet_id: current_user.id)
		 if note.save
		 	note.pet_id = @pet.id
		 	note.save
		 	redirect_to :back
		 end
	end

	def records
		@pet = Pet.find(params[:id])
		rec = Record.find_by("pet_id = #{@pet.id}")
		rec.update(fixed: params[:fixed], allergy: params[:allergy], behavior: params[:behavior])
		shot = Shot.new(records_id:"#{rec.id}", pet_id:"#{@pet.id}", vaccine:params[:vaccine])
		if shot.save
			redirect_to :back
		end

	end



# ------------------------------------------------

	private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar) 
  end

  	private
  def vet_params
    params.require(:vet).permit(:first_name, :last_name, :office_name, :email, :phone_number, :password) 
  end

   	private
  def address_params
    params.require(:address).permit(:street, :city, :state, :zip) 
  end
end
	