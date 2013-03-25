Thebeast::Application.routes.draw do
  
  resources :line_items


  resources :carts


  resources :products


  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  resources :likes

  root :to => 'static_pages#home'

  match 'signin' => 'sessions#new'

  match 'signout' => 'sessions#destroy', via: :delete

  match 'deliveraddress' => "accounts#deliveraddress"

  match 'orders' => "accounts#ordersinfo"

  match 'subscription' => "accounts#subscriptioninfo"

  match 'invitation' => "accounts#myinvitation"

  match 'cancelapplication' => "accounts#cancelapplication"

  match "signup" => 'users#new'

  match "like" => 'users#like'

  match 'faq' => 'help_pages#faq'

  match 'newbieguide' => 'help_pages#newbieguide'

  match 'afterservice' => 'help_pages#afterservice'

  match 'shippingintro' => 'help_pages#shippingintro'

  match 'privacy' => 'help_pages#privacy'

  match 'contact' => 'help_pages#contact'

  match 'about' => 'help_pages#about'

  match 'newproduct' => 'static_pages#newproduct'

  match 'beastflower' => 'static_pages#beastflower'

  match 'fragrance' =>  "static_pages#fragrance"

  match 'clothes' => "static_pages#clothes"

  match 'grocery' => "static_pages#grocery"

  match 'gift' => "static_pages#gift"

  match 'cooperation' => "static_pages#cooperation"

  match 'story' => "static_pages#story"

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
