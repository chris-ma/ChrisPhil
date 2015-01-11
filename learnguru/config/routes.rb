# == Route Map
#
#         Prefix Verb   URI Pattern                    Controller#Action
#     learnlists GET    /learnlists(.:format)          learnlists#index
#                POST   /learnlists(.:format)          learnlists#create
#  new_learnlist GET    /learnlists/new(.:format)      learnlists#new
# edit_learnlist GET    /learnlists/:id/edit(.:format) learnlists#edit
#      learnlist GET    /learnlists/:id(.:format)      learnlists#show
#                PATCH  /learnlists/:id(.:format)      learnlists#update
#                PUT    /learnlists/:id(.:format)      learnlists#update
#                DELETE /learnlists/:id(.:format)      learnlists#destroy
#       youtubes GET    /youtubes(.:format)            youtubes#index
#                POST   /youtubes(.:format)            youtubes#create
#    new_youtube GET    /youtubes/new(.:format)        youtubes#new
#           root GET    /                              learnlists#index
#

Rails.application.routes.draw do

  resources :learnlists

  resources :youtubes, only: [:index, :new, :create]


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'learnlists#index'

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
