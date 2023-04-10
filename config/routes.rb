Rails.application.routes.draw do
  # API routing
  scope module: 'api', defaults: {format: 'json'} do
    namespace :v1 do
      # provide the routes for the API here



    end
  end

  # Routes for regular HTML views go here...
  # Semi-static page routes
  get 'home', to: 'home#index', as: :home
  
  # Employee Routes
  get '/employees', to: 'employees#index', as: 'employees' 
  post '/employees' , to: 'employees#create'
  get '/employees/new', to: 'employees#new', as: 'new_employee' 
  get 'employees/:id/edit', to: 'employees#edit', as: 'edit_employee' 
  get '/employees/:id', to: 'employees#show', as: 'employee'
  patch '/employees/:id', to: 'employees#update' 
  put '/employees/id', to: 'employees#update' 
  delete '/employees/:id', to: 'employees#destroy'
  
        
  # Authentication routes
  get '/login', to: 'sessions#new', as: 'login' 
  get '/logout', to: 'sessions#destroy', as: 'logout'
        
  get '/sessions', to: 'sessions#index', as: 'sessions' 
  post '/sessions', to: 'sessions#create' 
  get '/sessions/new', to: 'sessions#new' , as: 'new_session' 
  get '/sessions/:id/edit', to: 'sessions#edit', as: 'edit_session'
  get '/sessions/:id', to: 'sessions#show', as: 'session' 
  patch '/sessions/:id', to: 'sessions#update'
  put '/sessions/:id', to: 'sessions#update' 
  delete 'sessions/:id', to: 'sessions#destroy'
        
  # Store Routes
  get '/stores', to: 'stores#index', as: 'stores' 
  post '/stores' , to: 'stores#create'
  get '/stores/new', to: 'stores#new', as: 'new_store' 
  get '/stores/:id/edit', to: 'stores#edit', as: 'edit_store' 
  get '/stores/:id', to: 'stores#show', as: 'store'
  patch '/stores/:id', to: 'stores#update' 
  put '/stores/:id', to: 'stores#update'
  
  # Assignment Routes
  get '/assignments', to: 'assignments#index', as: 'assignments' 
  post '/assignments', to: 'assignments#create' 
  get '/assignments/new', to: 'assignments#new', as: 'new_assignment'
  get 'assignments/:id/edit' ,to: 'assignments#edit', as: 'edit_assignment' 
  get '/assignments/:id', to: 'assignments#show', as: 'assignment'
  patch '/assignments/:id', to: 'assignments#update'
  delete '/assignments/:id', to: 'assignments#destroy'  
  
  # Job Routes
  get '/jobs', to: 'jobs#index', as: 'jobs' 
  post '/jobs', to: 'jobs#create' 
  get '/jobs/new', to: 'jobs#new', as: 'new_job'
  get 'jobs/:id/edit' ,to: 'jobs#edit', as: 'edit_job' 
  patch '/jobs/:id', to: 'jobs#update', as: 'job'
  delete '/jobs/:id', to: 'jobs#destroy'
  
end



