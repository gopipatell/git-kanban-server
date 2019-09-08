Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/users' => 'users#index'
  resources :users
  resources :tasks
  resources :repositories

  get '/auth/github', to: 'authentication#github', format: false

end
