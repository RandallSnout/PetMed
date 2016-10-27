class User < ActiveRecord::Base
  belongs_to :address
  belongs_to :vet
  has_secure_password
  has_attached_file :avatar

  validates :first_name, :last_name,  :presence => true

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], :on => :update 

end
