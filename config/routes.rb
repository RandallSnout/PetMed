Rails.application.routes.draw do

  root "pages#index"

# ------- [get] ----------------------------

  get '/update/user' => 'users#update_user_page'

  get '/update/vet' => 'users#update_vet_page'

# ------- [patch] ----------------------------
  patch '/users/update/:id' => 'users#update_user'

  patch '/vet/update/:id' => 'users#update_vet'
end
