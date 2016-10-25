Rails.application.routes.draw do

  root "pages#index"

# ------- [get] ----------------------------
  get '/update/user' => 'users#update_user_page'

  get '/update/vet' => 'users#update_vet_page'

  get '/update/pet' => 'pet#update_pet_page'

# ------- [patch] ----------------------------
  patch '/users/update/:id' => 'users#update_user'

  patch '/vet/update/:id' => 'users#update_vet'

  patch '/pet/update/:id' => 'pet#update'
end
