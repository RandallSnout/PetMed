class PetsController < ApplicationController
	def pet_update_page
		@pet = Pet.find(params[:id])
		@pin = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flattenstring = (0...50).map { o[rand(o.length)] }.join
	end

	def update
		pet = Pet.find(params[:id]).update(name:params[:pet_name_update], sex:params[:pet_name_update], species:params[:pet_species_update], age:params[:pet_age_update], color:params[:pet_color_update])
		# redirects to the user's page
		redirect_to ''
	end
end
