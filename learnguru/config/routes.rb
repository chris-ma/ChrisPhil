# == Route Map
#
#                   Prefix Verb     URI Pattern                                   Controller#Action
#                          GET      /auth/:provider/callback(.:format)            sessions#create
#   lesson_learnlist_index GET      /lesson_learnlist/index(.:format)             lesson_learnlist#index
#         new_user_session GET      /users/login(.:format)                        devise/sessions#new
#             user_session POST     /users/login(.:format)                        devise/sessions#create
#     destroy_user_session DELETE   /users/logout(.:format)                       devise/sessions#destroy
#  user_omniauth_authorize GET|POST /users/auth/:provider(.:format)               omniauth_callbacks#passthru {:provider=>/twitter/}
#   user_omniauth_callback GET|POST /users/auth/:action/callback(.:format)        omniauth_callbacks#:action
#            user_password POST     /users/password(.:format)                     devise/passwords#create
#        new_user_password GET      /users/password/new(.:format)                 devise/passwords#new
#       edit_user_password GET      /users/password/edit(.:format)                devise/passwords#edit
#                          PATCH    /users/password(.:format)                     devise/passwords#update
#                          PUT      /users/password(.:format)                     devise/passwords#update
# cancel_user_registration GET      /users/cancel(.:format)                       devise/registrations#cancel
#        user_registration POST     /users(.:format)                              devise/registrations#create
#    new_user_registration GET      /users/sign_up(.:format)                      devise/registrations#new
#   edit_user_registration GET      /users/edit(.:format)                         devise/registrations#edit
#                          PATCH    /users(.:format)                              devise/registrations#update
#                          PUT      /users(.:format)                              devise/registrations#update
#                          DELETE   /users(.:format)                              devise/registrations#destroy
#               learnlists GET      /learnlists(.:format)                         learnlists#index
#                          POST     /learnlists(.:format)                         learnlists#create
#            new_learnlist GET      /learnlists/new(.:format)                     learnlists#new
#           edit_learnlist GET      /learnlists/:id/edit(.:format)                learnlists#edit
#                learnlist GET      /learnlists/:id(.:format)                     learnlists#show
#                          PATCH    /learnlists/:id(.:format)                     learnlists#update
#                          PUT      /learnlists/:id(.:format)                     learnlists#update
#                          DELETE   /learnlists/:id(.:format)                     learnlists#destroy
#                  quizzes GET      /quizzes(.:format)                            quizzes#index
#                          POST     /quizzes(.:format)                            quizzes#create
#                 new_quiz GET      /quizzes/new(.:format)                        quizzes#new
#                edit_quiz GET      /quizzes/:id/edit(.:format)                   quizzes#edit
#                     quiz GET      /quizzes/:id(.:format)                        quizzes#show
#                          PATCH    /quizzes/:id(.:format)                        quizzes#update
#                          PUT      /quizzes/:id(.:format)                        quizzes#update
#                          DELETE   /quizzes/:id(.:format)                        quizzes#destroy
#                questions GET      /questions(.:format)                          questions#index
#                          POST     /questions(.:format)                          questions#create
#             new_question GET      /questions/new(.:format)                      questions#new
#            edit_question GET      /questions/:id/edit(.:format)                 questions#edit
#                 question GET      /questions/:id(.:format)                      questions#show
#                          PATCH    /questions/:id(.:format)                      questions#update
#                          PUT      /questions/:id(.:format)                      questions#update
#                          DELETE   /questions/:id(.:format)                      questions#destroy
#                  answers GET      /answers(.:format)                            answers#index
#                          POST     /answers(.:format)                            answers#create
#               new_answer GET      /answers/new(.:format)                        answers#new
#              edit_answer GET      /answers/:id/edit(.:format)                   answers#edit
#                   answer GET      /answers/:id(.:format)                        answers#show
#                          PATCH    /answers/:id(.:format)                        answers#update
#                          PUT      /answers/:id(.:format)                        answers#update
#                          DELETE   /answers/:id(.:format)                        answers#destroy
#                  lessons GET      /lessons(.:format)                            lessons#index
#                          POST     /lessons(.:format)                            lessons#create
#               new_lesson GET      /lessons/new(.:format)                        lessons#new
#              edit_lesson GET      /lessons/:id/edit(.:format)                   lessons#edit
#                   lesson GET      /lessons/:id(.:format)                        lessons#show
#                          PATCH    /lessons/:id(.:format)                        lessons#update
#                          PUT      /lessons/:id(.:format)                        lessons#update
#                          DELETE   /lessons/:id(.:format)                        lessons#destroy
#                 youtubes GET      /youtubes(.:format)                           youtubes#index
#                          POST     /youtubes(.:format)                           youtubes#create
#              new_youtube GET      /youtubes/new(.:format)                       youtubes#new
#          user_learnlists GET      /users/:user_id/learnlists(.:format)          learnlists#index
#                          POST     /users/:user_id/learnlists(.:format)          learnlists#create
#       new_user_learnlist GET      /users/:user_id/learnlists/new(.:format)      learnlists#new
#      edit_user_learnlist GET      /users/:user_id/learnlists/:id/edit(.:format) learnlists#edit
#           user_learnlist GET      /users/:user_id/learnlists/:id(.:format)      learnlists#show
#                          PATCH    /users/:user_id/learnlists/:id(.:format)      learnlists#update
#                          PUT      /users/:user_id/learnlists/:id(.:format)      learnlists#update
#                          DELETE   /users/:user_id/learnlists/:id(.:format)      learnlists#destroy
#                    users GET      /users(.:format)                              users#index
#                          POST     /users(.:format)                              users#create
#                 new_user GET      /users/new(.:format)                          users#new
#                edit_user GET      /users/:id/edit(.:format)                     users#edit
#                     user GET      /users/:id(.:format)                          users#show
#                          PATCH    /users/:id(.:format)                          users#update
#                          PUT      /users/:id(.:format)                          users#update
#                          DELETE   /users/:id(.:format)                          users#destroy
#                     root GET      /                                             learnlists#new
#

Rails.application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'
 
  get 'lesson_learnlist/index'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"},
                   controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :learnlists
  resources :quizzes
  resources :questions
  resources :answers
  resources :lessons 

  # scope ':user_id' do
  # resources :learnlists
  # end

  # resources :users do 
  #     resources :learnlists
  #   end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'learnlists#new'

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
