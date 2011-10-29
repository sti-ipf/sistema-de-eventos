Eieosasco::Application.routes.draw do

  localized do
    resources :registrations
    resources :users
    resources :user_sessions
    resources :activities
    resources :papers
    
    root :to => "home#index"

    match "registration_destroy/:id" =>'registrations#destroy', :as => 'registration_destroy'
    match "paper_destroy/:id" =>'papers#destroy', :as => 'paper_destroy'

    match "registration/completed" =>'registrations#completed', :as => 'registration_completed'
    match "validate_paper_user" =>'papers#validate_paper_user', :as => 'validate_paper_user'
    match "new_paper_user" =>'papers#new', :as => 'new_paper_user'
    match "registration_new" =>'registrations#new', :as => 'registration_new'

    match 'sign_up' => 'users#sign_up', :as => 'sign_up'
    match 'sign_in' => 'user_sessions#new', :as => 'sign_in'
    match 'sign_out' => 'user_sessions#destroy', :as => 'sign_out'

    match 'paineis/:id/participantes' => 'activities#participations', :as => 'participations_per_activity'

    match 'search/employees' => 'employees#search', :as => 'employees_search'

    match 'export_data/registrations' => 'registrations#export_data', :as => 'export_data_registrations'
    match 'papers/:id/update_status/:status' => 'papers#update_status', :as => 'update_paper_status'
    match 'dashboard' => 'home#index', :as => 'dashboard'
  end


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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

