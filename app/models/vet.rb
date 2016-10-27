class Vet < ActiveRecord::Base
  belongs_to :address
  has_secure_password
  has_attached_file :avatar
  has_many :comments

  
  validates :phone_number, :presence => true
  validates :first_name, :last_name, :office_name, :presence => true
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
