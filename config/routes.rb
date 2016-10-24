Rails.application.routes.draw do

  root "pages#index"

  get '/update' => 'users#update_page'

  post '/users/update/:id' => 'users#update_user'
end
