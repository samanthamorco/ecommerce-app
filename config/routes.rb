Rails.application.routes.draw do

  get '/games', to: 'products#games'
  # get '/parameters', to:'products#parameters'

  post '/games/new', to:'products#new', as: '/new'
  post '/games', to:'products#create'
  get '/games/:id', to: 'products#show', as: '/product'
  get '/games/:id/edit', to: 'products#edit', as: '/edit'
  get '/games/:id/images/new', to: 'images#new'
  post '/games/:id', to:'products#create'
  post '/games/:id', to:'images#create'
  patch '/games/:id', to: 'products#update'
  delete '/games/:id', to: 'products#destroy'

  post '/games/search', to:'products#search'



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
