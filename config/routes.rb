Hashtrek::Application.routes.draw do
  get "searches/index"
  get "searches/new"
  get "searches/create"
  get "searches/destroy"
  get "related_hashtags/index"
  get "related_hashtags/new"
  get "related_hashtags/create"
  get "related_hashtags/edit"
  get "related_hashtags/update"
  get "related_hashtags/destroy"
  get "hashtag_feeds/index"
  get "hashtag_feeds/new"
  get "hashtag_feeds/create"
  get "hashtag_feeds/edit"
  get "hashtag_feeds/update"
  get "hashtag_feeds/destroy"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'searches#new'

  namespace :api, defaults: {format: :json} do
     resources :related_hashtags, only: [:index]
  end

  resources :searches
  resources :hashtag_feeds do
    resources :related_hashtags
  end 

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
