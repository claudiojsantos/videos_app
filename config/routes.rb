Rails.application.routes.draw do
  # get 'videos/index/:user_id'
  # get 'videos/new'
  # get 'videos/create'
  # get 'videos/edit'
  # get 'videos/update'
  # get 'videos/delete'

  get 'main/index'
  get 'view_increment/:id', to: 'videos#view_increment'

  root :to => 'main#index'

  resources :videos
  
  devise_for :users

end
