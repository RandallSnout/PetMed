class Shot < ActiveRecord::Base
  belongs_to :pets
  belongs_to :records
end
