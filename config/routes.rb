Rails.application.routes.draw do

  root 'home#landing'
  post '/auth' => 'session#auth'
  get '/logout' => 'session#destroy'

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

  # BASIC USER ROLE ROUTES

  get '/basic' => 'basic#dashboard'
  get '/basic/profile' => 'profile#myprofile'

  get '/jwt' => 'jwt#test'
  get '/jwt/decode' => 'jwt#decode'

  get '/db' => 'job#test'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
