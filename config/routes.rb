NewTest::Application.routes.draw do


  #get "home/index"

  root :to => 'homes#index'   

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
  post '/refinery/blog/comments/mass_delete_comments', :to => 'refinery/blog/admin/comments#mass_delete_comments'

    
  # TAG REDIRECTION
  
  match "/blog/tag/:tag_name", :to => "refinery/blog/posts#tagged"

  #########################

  # User Sitemap
  
  match "/sitemap", :to => "refinery/sitemap#index"

  #######################

  
  match '/contact_us', :to => 'homes#contact'

  match '/index', :to => 'homes#index'

  match '/services', :to => 'static_pages#services', :via => [:get]

  match '/technologies', :to => "static_pages#technologies", :via => [:get]

  match '/manufacturing', :to => 'static_pages#manufacturing', :via => [:get]

  match '/financial_services', :to => "static_pages#financial_services", :via => [:get]

  match '/technology', :to => "static_pages#industry_technology", :via => [:get]

  match '/life_sciences', :to => "static_pages#life_sciences", :via => [:get]

  match '/real_estates', :to => "static_pages#real_estates", :via => [:get]

  match '/about_us', :to => 'static_pages#about_us', :via => [:get]

  match '/team', :to => "static_pages#team", :via => [:get]

  match '/passion_to_action', :to => "static_pages#passion_to_action", :via => [:get]

  match '/heritage', :to => "static_pages#heritage", :via => [:get]

  match '/award', :to => "static_pages#award", :via => [:get]

  match '/careers', :to => "static_pages#careers", :via => [:get]



  mount Refinery::Core::Engine, :at => '/'


 

end