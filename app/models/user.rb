class User < ActiveRecord::Base
  belongs_to :address
  has_secure_password

  validates :first_name, :last_name,  :presence => true
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true


end
