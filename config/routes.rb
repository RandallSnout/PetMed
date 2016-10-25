Rails.application.routes.draw do

  root "pages#index"
  get "pages/finder" => "pages#finder"
  get "pages/about" => "pages#about"

  get "sessions/new" => "sessions#new"

# ------- [post] ----------------------------

	post "users/register" => "users@create"

  post "pet/create" => "pets@create"

# ------- [get] ----------------------------
  get '/users/profile' => 'users#users_profile'

  get '/update/user' => 'users#update_user_page'

  get '/update/vet' => 'users#update_vet_page'

  get '/new/pet' => 'pets#new'

  get '/update/pet' => 'pet#update_pet_page'

# ------- [patch] ----------------------------
  patch '/users/update/:id' => 'users#update_user'

  patch '/vet/update/:id' => 'users#update_vet'

  patch '/pet/update/:id' => 'pet#update'

end
