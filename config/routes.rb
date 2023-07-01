Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index,:show,:edit,:update] do
    member do
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end


end

                #                   Prefix Verb   URI Pattern                                                                                       Controller#Action
                #         new_user_session GET    /users/sign_in(.:format)                                                                          devise/sessions#new
                #             user_session POST   /users/sign_in(.:format)                                                                          devise/sessions#create
                #     destroy_user_session DELETE /users/sign_out(.:format)                                                                         devise/sessions#destroy
                #       new_user_password GET    /users/password/new(.:format)                                                                     devise/passwords#new
                #       edit_user_password GET    /users/password/edit(.:format)                                                                    devise/passwords#edit
                #           user_password PATCH  /users/password(.:format)                                                                         devise/passwords#update
                #                         PUT    /users/password(.:format)                                                                         devise/passwords#update
                #                         POST   /users/password(.:format)                                                                         devise/passwords#create
                # cancel_user_registration GET    /users/cancel(.:format)                                                                           devise/registrations#cancel
                #   new_user_registration GET    /users/sign_up(.:format)                                                                          devise/registrations#new
                #   edit_user_registration GET    /users/edit(.:format)                                                                             devise/registrations#edit
                #       user_registration PATCH  /users(.:format)                                                                                  devise/registrations#update
                #                         PUT    /users(.:format)                                                                                  devise/registrations#update
                #                         DELETE /users(.:format)                                                                                  devise/registrations#destroy
                #                         POST   /users(.:format)                                                                                  devise/registrations#create
                #                     root GET    /                                                                                                 homes#top
                #               home_about GET    /home/about(.:format)                                                                             homes#about
                #       book_book_comments POST   /books/:book_id/book_comments(.:format)                                                           book_comments#create
                #       book_book_comment DELETE /books/:book_id/book_comments/:id(.:format)                                                       book_comments#destroy
                #           book_favorites DELETE /books/:book_id/favorites(.:format)                                                               favorites#destroy
                #                         POST   /books/:book_id/favorites(.:format)                                                               favorites#create
                #                   books GET    /books(.:format)                                                                                  books#index
                #                         POST   /books(.:format)                                                                                  books#create
                #               edit_book GET    /books/:id/edit(.:format)                                                                         books#edit
                #                     book GET    /books/:id(.:format)                                                                              books#show
                #                         PATCH  /books/:id(.:format)                                                                              books#update
                #                         PUT    /books/:id(.:format)                                                                              books#update
                #                         DELETE /books/:id(.:format)                                                                              books#destroy
                #             follows_user GET    /users/:id/follows(.:format)                                                                      users#follows
                #           followers_user GET    /users/:id/followers(.:format)                                                                    users#followers
                #       user_relationships DELETE /users/:user_id/relationships(.:format)                                                           relationships#destroy
                #                         POST   /users/:user_id/relationships(.:format)                                                           relationships#create
                #                   users GET    /users(.:format)                                                                                  users#index
                #               edit_user GET    /users/:id/edit(.:format)                                                                         users#edit
                #                     user GET    /users/:id(.:format)                                                                              users#show
                #                         PATCH  /users/:id(.:format)                                                                              users#update
                #                         PUT    /users/:id(.:format)                                                                              users#update