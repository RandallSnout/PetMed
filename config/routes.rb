Rails.application.routes.draw do
# -------[root]--------------------------------------------------
  root "pages#index"

# -------[front end pages]---------------------------------------
  get "pages/finder" => "pages#finder"
  get "pages/about" => "pages#about"

# -------[new owner]---------------------------------------------
  get "sessions/new" => "sessions#new"

# -------[new vet]-----------------------------------------------
  # get "vets/register" => "users#create_vet"
  get "sessions/vet_new" => "sessions#vet_new"

# -------[post for new pet/user/vet]-----------------------------
  post 'sessions/signin' => 'sessions#login'
  post "users/register" => "users#create_user"
  post "vets/register" => "users#create_vet"
  post "pets/create" => "pets#create"
  post "note/:id" => "users#notes"

  
# -------[Both User and Vet Redirect]----------------------
  get "profile/:id" => "users#redirect"
  get "vet_profile/:id" => "users#vet_redirect"

# -------[vet main profile page and update]----------------------
  get "vets/:id" => "users#vet_profile"
  get "pets/admin/:id" => "users#vet_input"

# -------[owner to vets profile page]-----------------------------
  get "vets/public/:id" => "users#vet_show"
  get "update/vet/:id" => "users#update_vet_page"

# -------[main user page and update]----------------------------- 
  get "users/:id" => "users#users_profile"
  get 'update/user/:id' => 'users#update_user_page'
  get 'users/bypass/:id' => 'users#update_user'
  get "users/change/:id" => "users#change_vet"
  
# -------[pet register/update/profile]---------------------------
  get 'new/pet' => 'pets#new'
  get 'update/pet/:id' => 'pets#pet_update_page'
  get 'pets/profile/:id' => 'pets#profile'
  get 'pets/delete/:id' => 'pets#delete'

# -------[patch for pet/vet/owner updates]-----------------------
  patch "users/profilePic/:id" => 'users#update_user_pic'
  patch "vets/profilePic/:id" => 'users#update_vet_pic'
  patch "users/update/:id" => 'users#update_user'
  patch "vets/update/:id" => 'users#update_vet'
  patch "pet/update/:id" => 'pets#update'
  patch "records/:id" => "users#records"

# -------[destroy]-----------------------------------------------
  delete 'sessions/logout' => 'sessions#destroy'


  # get "sessions/doc-new/" => "sessions#vet_new"
  # get "user/profile" => "users#users_profile"
  # get "users/:id" => "users#users_profile"
  # get '/users/:id' => 'users#users_profile'
  # get "vets/:id" => "users#vets_profile"
end
