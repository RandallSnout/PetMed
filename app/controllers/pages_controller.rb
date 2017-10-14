class PagesController < ApplicationController

	def index
	end

	def finder

		@vets = Vet.joins(:address).select("vets.id as VET_ID", :first_name, :last_name, :street, :city, :state, :zip, :office_name)
		if current_user 
			@a = Vet.joins(:users, :address).select("vets.id as VETS_ID", "vets.first_name as VETS_FN","vets.last_name as VETS_LN", "vets.email", "users.id as USER_ID", "users.first_name as USERS_FN", "users.last_name as USERS_LN", :street, :city, :state, :city).find_by("users.id = #{current_user.id}")
		end

		# @users = User.select(:first_name, :last_name, :email)
	end

	def about
	end
end
