Rails.application.routes.draw do
  
  get "/users" => 'users#home'
  
  get "/users/:id/delete" => 'users#delete'
  
  get "/users/:id/edit" => 'users#edit'
  
  put "/users/:id/save" => 'users#save'
  
  get "/users/:user_id/stories" => 'stories#user_stories'
  
  get "/users/:user_id/stories/new" => 'stories#new'
  
  post "/users/:user_id/stories" => 'stories#save'
  
  get "/users/:user_id/stories/delete/:id" => 'stories#delete'
  
  get "/users/:user_id/stories/edit/:id" => 'stories#edit'
  
  put "/users/:user_id/stories/:id" => 'stories#save_edit'
  
  get "/" => 'logins#login'
  
  post "/save_signup" => 'logins#save_signup'
  
  post "/verify_login" => 'logins#verify_login'
  
  get "/logout" => 'logins#logout'
  
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
