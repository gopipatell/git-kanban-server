Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/users' => 'users#index'
  resources :users
  resources :tasks
  resources :repositories

  get '/auth/github', to: 'authentication#github', format: false
  post '/repositories/:id/update-task-index', to: 'repositories#update_task_index', as: 'update_task_index', format: false

end
