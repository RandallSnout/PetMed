class UsersController < ApplicationController
	before_action :current_user, only:[:edit, :update, :destroy]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	

	def create
	end

	def update_page
	end

	def update_user
		user_update = User.update(first_name:params[:first_name_update], last_name:params[:last_name_update], email:params[:email_update])
		address_update = Address.update(street:params[:street_update], city:params[:city_update], state:params[:state_update], zip:params[:zip_update])

		# redirect to the main user page
		redirect_to '' 
	end
end
