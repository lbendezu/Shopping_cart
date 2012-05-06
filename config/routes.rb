Testproy::Application.routes.draw do 
  root :to => "Products#list", :as => 'root'

  
  resources :locations

  match 'products/show_shopping_cart' => 'Products#show_shopping_cart', :as => 'show_shopping_cart'
  match 'products/add_item/:id' => 'Products#add_item', :as => 'add_item'
  match 'products/update_item/:id/:quantity' => 'Products#update_item', :as => 'update_item'
  match 'products/delete_item/:id' => 'Products#delete_item', :as => 'delete_item'
  match 'products/update_shopping_cart' => 'Products#update_shopping_cart', :as => 'update_shopping_cart'

  resources :products

  #match 'locations/new' => 'Locations#new'
  #match 'locations' => 'Locations#list'
  #match 'locations/maintain' => 'Locations#maintain'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
