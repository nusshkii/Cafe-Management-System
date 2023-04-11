Rails.application.routes.draw do
  # API routing
  scope module: 'api', defaults: {format: 'json'} do
    namespace :v1 do
      # provide the routes for the API here



    end
  end

  # Routes for regular HTML views go here...
  # Semi-static page routes
  root 'home#index'
  get 'home', to: 'home#index', as: :home
  get '/about', to: 'home#about', as: :about
  get '/contact', to: 'home#contact', as: :contact
  get '/privacy', to: 'home#privacy', as: :privacy
  
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

  # PayGrade Routes
  get '/pay_grades', to: 'pay_grades#index', as: 'pay_grades'
  post '/pay_grades', to: 'pay_grades#create'
  get '/pay_grades/new', to: 'pay_grades#new', as: 'new_pay_grade'
  get '/pay_grades/:id/edit', to: 'pay_grades#edit', as: 'edit_pay_grade'
  get '/pay_grades/:id', to: 'pay_grades#show', as: 'pay_grade'
  patch '/pay_grades/:id', to: 'pay_grades#update'
  
  # PayGradeRates Routes
  get '/pay_grade_rates', to: 'pay_grade_rates#index', as: 'pay_grade_rates'
  post '/pay_grade_rates', to: 'pay_grade_rates#create', as: 'create_pay_grade_rates'
  get '/pay_grade_rates/new', to: 'pay_grade_rates#new', as: 'new_pay_grade_rate'
  get '/pay_grade_rates/:id/edit', to: 'pay_grade_rates#edit', as: 'edit_pay_grade_rate'
  get '/pay_grade_rates/:id', to: 'pay_grade_rates#show', as: 'pay_grade_rate'
  patch '/pay_grade_rates/:id', to: 'pay_grade_rates#update'

  
  # Shifts Routes
  get '/shifts', to: 'shifts#index', as: 'shifts'
  post '/shifts', to: 'shifts#create'
  get '/shifts/new', to: 'shifts#new', as: 'new_shift'
  get '/shifts/:id/edit', to: 'shifts#edit', as: 'edit_shift'
  get '/shifts/:id', to: 'shifts#show', as: 'shift'
  patch '/shifts/:id', to: 'shifts#update'
  delete '/shifts/:id', to: 'shifts#destroy'
  patch '/time_in', to: 'shifts#time_in', as: 'time_in'
  patch '/time_out', to: 'shifts#time_out', as: 'time_out'
  get '/time_clock', to: 'shifts#time_clock', as: 'time_clock'

  # ShiftJobs Routes
  get '/shift_jobs', to: 'shift_jobs#index', as: 'shift_jobs'
  post '/shift_jobs', to: 'shift_jobs#create'
  get '/shift_jobs/new', to: 'shift_jobs#new', as: 'new_shift_job'
  get '/shift_jobs/:id/edit', to: 'shift_jobs#edit', as: 'edit_shift_job'
  get '/shift_jobs/:id', to: 'shift_jobs#show', as: 'shift_job'
  patch '/shift_jobs/:id', to: 'shift_jobs#update'
  delete '/shift_jobs/:id', to: 'shift_jobs#destroy'

  #payrolls
  get '/store_form', to: 'payrolls#store_form' , as: 'store_form'
  get '/employee_form' , to: 'payrolls#employee_form',  as:  'employee_form'
  get '/employee_payroll', to: 'payrolls#employee_payroll', as: 'employee_payroll'
  get '/store_payroll', to: 'payrolls#store_payroll', as: 'store_payroll'
  
end



