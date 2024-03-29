Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers, except: %i[index show update create delete] do
        resources :subscriptions, only: %i[create update index]
      end
    end
  end
end
