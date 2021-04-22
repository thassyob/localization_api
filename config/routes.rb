Rails.application.routes.draw do
  namespace :api do
      namespace :v1 do
        mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          registrations: 'api/v1/auth/registrations',
          sessions: 'api/v1/auth/sessions',
      }
        
        resources :testimonials, only: :create
        resources :users, only: %i[update show]
        resources :locations, only: %i[create show] do
        get 'list_locations_alphabetically', on: :collection
        get 'list_locations_by_approximation', on: :collection
      end
    end
  end
end