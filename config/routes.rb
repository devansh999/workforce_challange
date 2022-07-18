Rails.application.routes.draw do
  root to: "organisations#index"

  devise_for :users do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :organisations do
    member do
      put :join
      put :leave
    end
  end
  resources :shifts do
    collection do
      get :search
    end
  end
end
