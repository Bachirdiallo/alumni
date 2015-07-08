Rails.application.routes.draw do

  resources :jobs
root to: 'pages#index'
  get 'pages/index'


  resources :graduations
  resources :batches do
    collection do
      post :action_import
    end
  end
  resources :campus
  resources :faculties
  resources :programmes
  devise_for :users
  resources :users

  resources :user_profiles do
    get :view_profile
    collection do
      post :upload_profile_picture

    end
  end

  resources :find_users do
    collection do
      get :file_content
    end
  end

  resources :import do
    collection do
      post :import
      post :importing
    end
  end

  #pages
  #get '/claim_account', to: 'pages#claim_account'
  #get '/claim_action_result', to: 'pages#claim_action_result'
  post '/add_email', to: 'pages#add_email'

  resources :pages do
    collection do
      get :claim_account
      get :claim_action_result
    end
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".



  # You can have the root of your site routed with "root"
  #root 'welcome#index'
#  devise_scope :user do
  #  get 'admin' => 'devise#admin'
  #end
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  resources :members
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
