class User < ActiveRecord::Base
  belongs_to :address
  has_secure_password
  has_attached_file :avatar


  validate :phone_number
  def phone_number_should_not_be_blank
  	if !phone_number.blank?
  		errors.add(:phone_number, "You vet will be able to contact you more better if you give you phone number.  Are you sure you wanna continyou?")
  	end
  end

  validates :first_name, :last_name,  :presence => true
  
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], :on => :update 

end
