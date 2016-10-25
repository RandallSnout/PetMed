class Address < ActiveRecord::Base
	has_one :address
	has_one :address

	validates :street, :state,  :city, :presence => true
	validates :zip,  numericality: { only_integer: true }
end
