class PetsController < ApplicationController

	def profile
		@current = Pet.find(params[:id])
		@shots = Shot.where("pet_id = #{params[:id]}").all
		@record = Record.where("pet_id = #{params[:id]}").first
		@comments = Vet.joins(:comments).select("note", "first_name", "last_name", "comments.created_at", "pet_id").where("pet_id = #{params[:id]}")
	end

	def pet_update_page
		@pet = Pet.find(params[:id])
	end

	def new
	end

	def create
		pin = [*('a'..'z'),*('0'..'9')].shuffle[0,9].join
		pet = Pet.new(name:params[:pet_name], sex:params[:pet_sex], species:params[:pet_species], age:params[:pet_age], color: params[:pet_color], breed:params[:pet_breed], pin:pin, user_id: current_user.id, avatar:params[:avatar])
		if pet.save
			Record.create(pet_id: pet.id)
			redirect_to "/users/#{current_user.id}"
  		else
  			flash[:errors] = pet.errors.full_messages
  			redirect_to :back
  		end
	end

	def update
		if params[:avatar]
			@pet = Pet.find(params[:id]).update(name:params[:pet_name_update], sex:params[:pet_sex_update], species:params[:pet_species_update], breed: params[:breed], age:params[:pet_age_update], color:params[:pet_color_update], avatar: params[:avatar])
			# redirects to the user's page
			redirect_to "/users/#{current_user.id}"
		else 
			@pet = Pet.find(params[:id]).update(name:params[:pet_name_update], sex:params[:pet_sex_update], species:params[:pet_species_update], breed: params[:breed], age:params[:pet_age_update], color:params[:pet_color_update])
			redirect_to "/users/#{current_user.id}"
		end
	end

	def delete
		Pet.find(params[:id]).destroy
		redirect_to :back
	end
end
