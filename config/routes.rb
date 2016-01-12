Rails.application.routes.draw do


  root 'public#job'

  #get '/thm' => 'public#jobthm'

  get '/login' => 'home#landing'
  post '/auth' => 'session#auth'
  get '/logout' => 'session#destroy'
  get '/register' => 'public#register'
  post '/signup' => 'public#signup'

  get '/job' => 'public#job'
  get '/job/:ids' => 'public#jobdetail'

  get '/ajax/reg/city/:ids' => 'ajax#ajaxcityregister'

  # ADMIN ROLE ROUTES

  get '/admin' => 'admin#dashboard'

  get '/admin/jobs' => 'job#list'
  get '/admin/jobs/new' => 'job#new'
  post '/admin/jobs/submit' => 'job#submit'
  get '/admin/jobs/edit/:ids' => 'job#edit'
  post '/admin/jobs/update/:ids' => 'job#update'

  get '/admin/payments' => 'payments#list'
  get '/admin/payments/:ids' => 'payments#details'
  get '/admin/payments/:ids/approve' => 'payments#approve'
  get '/admin/payments/:ids/decline' => 'payments#decline'

  get '/admin/users' => 'users#list'
  get '/admin/users/new' => 'users#new'
  post '/admin/users/submit' => 'users#submit'
  get '/admin/users/edit/:ids' => 'users#edit'
  post '/admin/users/update/:ids' => 'users#update'
  get '/admin/users/delete/:ids' => 'users#delete'

  get '/ajax/citylist/:state' => 'ajax#citylist'
  get '/ajax/citylist/usr/:state' => 'ajax#citylistusr'
  get '/ajax/payment/id/:ids' => 'ajax#paybyid'
  post '/ajax/payment/filter' => 'ajax#paybydate'

  get '/admin/articles' => 'article#list'
  get '/admin/articles/new' => 'article#new'
  post '/admin/articles/submit' => 'article#submit'
  get '/admin/articles/edit/:ids' => 'article#edit'
  post '/admin/articles/update/:ids' => 'article#update'

  # COMPANY ROLE ROUTES

  get '/company' => 'company#dash'
  get '/company/jobs' => 'company_jobs#list'
  get '/company/jobs/new' => 'company_jobs#new'
  post '/company/jobs/submit' => 'company_jobs#submit'
  get '/company/jobs/edit/:ids' => 'company_jobs#edit'
  post '/company/jobs/update/:ids' => 'company_jobs#update'
  get '/company/jobs/delete/:ids' => 'company_jobs#delete'
  get '/company/payments' => 'company_payment#list'
  get '/company/payments/:ids' => 'company_payment#details'

  post '/ajax/payment/filter/company' => 'ajax#paybydatecompany'

  # BASIC USER ROLE ROUTES

  get '/basic' => 'basic#dashboard'
  get '/basic/profile' => 'profile#myprofile'
  post '/basic/profile/update' => 'profile#update'
  post '/basic/profile/details/update' => 'profile#updatedetails'

  post '/ajax/exp/add' => 'ajax#addExp'
  get '/ajax/exp/del/:ids' => 'ajax#delExp'

  # API ROUTES

  namespace :api do
    namespace :v1 do
      resources :job
      post '/auth' => 'auth#request_token'
    end
  end

end
