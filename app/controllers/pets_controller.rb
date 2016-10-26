class PetsController < ApplicationController

	def profile
		@current = Pet.find(params[:id])
	end
	

	def pet_update_page
		@pet = Pet.find(params[:id])
	end

	def new
	end

	def create
		pin = [*('a'..'z'),*('0'..'9')].shuffle[0,9].join
		pet = Pet.new(name:params[:pet_name], sex:params[:pet_sex], species:params[:pet_species], age:params[:pet_age], color: params[:pet_color], breed:params[:pet_breed], pin: pin, user_id: current_user.id, avatar: params[:avatar])
		if pet.save
			flash[:success] = "Pet has been added."
			redirect_to :back
  		else
  			flash[:errors] = pet.errors.full_messages
  			redirect_to :back
  		end
	end

	def update
		@pet = Pet.find(params[:id]).update(name:params[:pet_name_update], sex:params[:pet_sex_update], species:params[:pet_species_update], age:params[:pet_age_update], color:params[:pet_color_update])
		# redirects to the user's page
		redirect_to "/users/profile/#{current_user.id}"
	end
end
