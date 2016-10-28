class Vet < ActiveRecord::Base
  belongs_to :address
  has_secure_password
  has_attached_file :avatar
  has_many :comments
  has_many :users


  validates :phone_number, :presence => true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format" }
  validates :first_name, :last_name, :office_name, :presence => true
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
