Rails.application.routes.draw do
  devise_for :users
  # resources :meetings, :all_meetings

  resources :meetings, :all_meetings do
    collection do
      get 'day_calendar'
      get 'list'
    end
  end

  get 'users/:id', to: 'users#show', as: 'user_show'

  # get 'day_calendar', to: 'all_meetings#day_calendar', as: 'all_meetings_day_calendar'
  # get 'day_calendar', to: 'meetings#day_calendar', as: 'meetings_day_calendar'
  # get 'list', to: 'all_meetings#list', as: 'all_meetings_list'
  # get 'list', to: 'meetings#list', as: 'meetings_list'

  #get 'day_calendar/:start_time' => 'all_meetings#day_calendar'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'all_meetings#index'

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