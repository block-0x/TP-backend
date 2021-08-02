Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :test, only: %i[index]
      resources :likes, only: %i[index create]
      resources :chat_rooms, only: %i[index show]
      resources :messages, only: %i[create]
      resources :users, only: %i[index show update]
      resources :contents, only: %i[index]

      resources :post_tags, only: %i[create destroy]
      resources :tags, only: %i[create update]

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      controller :contents do
        get 'c/:title', to: 'contents#show' do
          # get 'p/:uuid', to: 'posts#show'
        end
      end

      namespace :admin do
        resources :contents, only: %i[create update]
        resources :posts, only: %i[create update]
      end

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end
