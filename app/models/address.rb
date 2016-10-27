class Address < ActiveRecord::Base
	has_one :user
	has_one :vet
	validates :street, :state,  :city, :presence => true
	validates :zip,  numericality: { only_integer: true }
end
