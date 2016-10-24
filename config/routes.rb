Rails.application.routes.draw do
# users restful routes ------------------------

  get 'users#index'
  get 'users#new'
  post 'users#create'
  get 'users#show'
  get 'users#edit'
  patch 'users#update'
  delete 'users#destroy'


end
