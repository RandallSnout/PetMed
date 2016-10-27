class Record < ActiveRecord::Base
  belongs_to :pets
  has_many :shots
end
