Rails.application.routes.draw do
  root 'home#index'

  match '/home',  to: 'home#index', via: :get
  match '/home/show',  to: 'home#show', via: :get
  match '/auth/:provider/callback', to: 'sessions#callback', :via => [:get, :post]
  match '/cheki_list',  to: 'cheki_list#show', via: :get
  match '/cheki_list/update/',  to: 'cheki_list#update', via: :post
  match '/cheki_list/delete/:id',  to: 'cheki_list#delete', via: :get
  # resources :cheki_list, :except => [:index, :new, :create, :edit]
  match '/event_list',  to: 'event_list#show', via: :get
  match '/event_list/stock/:id',  to: 'event_list#stock', via: :get
  match '/logout', to: 'sessions#destroy', via: :get

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
