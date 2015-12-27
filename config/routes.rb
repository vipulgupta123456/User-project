Rails.application.routes.draw do
 

  resources :phones

  resources :sessions
  get 'sessions/login', to: 'sessions#login', as: 'login'
 get 'sessions/logout', to: 'sessions#logout', as: 'logout'
  get 'sessions/home', to: 'sessions#home', as: 'home'
  get 'phones/new', to:'phones#new'
  get 'sessions/login_attempt', to: 'sessions#login_attempt', as: 'login_attempt'
  get 'phones/index',to:'phones#index'
  get 'phones/show',to:'phones#show'
  get 'sessions/:id/edit', to: 'sessions#edit'
  post 'sessions/login_attempt', to: 'sessions#login_attempt'
  get 'sessions/profile', to: 'sessions#profile', as: 'profile'

  get 'sessions/setting', to: 'sessions#setting', as: 'setting'
  resources :users
   get 'users/new', to: 'users#new', as: 'signup'
  get 'users/create', to: 'users#create'
 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

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
