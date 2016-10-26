Rails.application.routes.draw do

  root "pages#index"
  get "pages/finder" => "pages#finder"
  get "pages/about" => "pages#about"
  get "sessions/new" => "sessions#new"
  get "sessions/doc-new/" => "sessions#vet_new"
  get "user/profile" => "users#users_profile"

  get "users/:id" => "users#users_profile"
  get "vets/register" => "users#create_vet"
  get "vet/:id" => "users#vet_profile"

# ------- [post] ----------------------------
  post 'sessions/signin' => 'sessions#login'
  post "users/register" => "users#create_user"
  post "vets/register" => "users#create_vet"
  post "pets/create" => "pets#create"

# ------- [get] ----------------------------


  get '/update/user/:id' => 'users#update_user_page'

  get '/update/vet' => 'users#update_vet_page'

  get '/new/pet' => 'pets#new'

  get '/pets/profile/:id' => 'pets#profile'

  get "users/:id" => "users#users_profile"

  get "vets/:id" => "users#vets_profile"

  get "vets/public/:id" => "users#vet_show"

  get '/users/:id' => 'users#users_profile'

  get '/update/pet/:id' => 'pets#pet_update_page'

# ------- [patch] ----------------------------
  patch '/users/update/:id' => 'users#update_user'

  patch '/vet/update/:id' => 'users#update_vet'

  patch '/pet/update/:id' => 'pets#update'

# ------- [destroy] ----------------------------
	delete 'sessions/logout' => 'sessions#destroy'

end
