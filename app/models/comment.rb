class Comment < ActiveRecord::Base
  belongs_to :pets
  belongs_to :vets
end
