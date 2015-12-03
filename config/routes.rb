Rails.application.routes.draw do

  devise_for :users
  root to: "products#index"

  get '/index', to: 'products#index'
  post '/index/new', to:'products#new', as: '/new'
  post '/index', to:'products#create'
  get '/index/:id', to: 'products#show', as: '/product'
  get '/index/:id/edit', to: 'products#edit'
  post '/index/search', to:'products#search'

  patch '/index/:id', to: 'products#update'
  delete '/index/:id', to: 'products#destroy'
  get '/index/images/new', to: 'images#new'
  post '/index', to: 'images#create'

  get "/cart", to: 'carted_products#index'
  post "/cart", to: 'carted_products#create'
  delete "/cart/:id", to: 'carted_products#destroy'

  post "/orders", to: 'orders#create'
  get "/orders/:id", to: 'orders#show'

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
