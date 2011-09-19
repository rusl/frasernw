Frasernw::Application.routes.draw do

  post "versions/:id/revert" => "versions#revert", :as => "revert_version"

  match "/versions"                 => "versions#show_all", :as => "all_versions"
  match "/specialists/:id/versions" => "versions#index",    :as => "show_versions", :model => 'specialists'
  match "/versions/:id"             => "versions#show",     :as => "show_version"

  resources :specializations do
    resources :specialists
    resources :procedures
    resources :clinics
  end
  resources :clinics
  resources :specialists
  resources :procedures
  resources :hospitals

  match "tracker" => 'tracker#index', :as => 'tracker'
  
  match "specializations/:id/showalt" => 'specializations#showalt'
  
  match "specialists/:id/:token/edit"   => 'specialists_editor#edit',  :as => 'specialist_self_edit'
  match "specialists/:id/:token/update" => 'specialists_editor#update'
  post  "specialists/email/:id"         => 'specialists#email', :as => 'specialist_email'
  
  match 'user/edit' => 'users#edit', :as => :edit_current_user

  match 'signup' => 'users#new', :as => :signup

  match 'logout' => 'user_sessions#destroy', :as => :logout

  match 'login' => 'user_sessions#new', :as => :login

  resources :user_sessions

  resources :users

  match 'searchtree'  => 'searchdoc#tree',  :as => :searchtree
  match 'searchindex' => 'searchdoc#index', :as => :searchindex

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
  root :to => 'specializations#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
