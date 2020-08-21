Rails.application.routes.draw do
  devise_for :users,
               path: '',
               path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
               },
               controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
               }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :quotes do
    get :favorites, on: :collection
    post :set_favorite, on: :collection
    get :random, on: :collection
    get :daily, on: :collection
    post :set_daily, on: :member
  end

  resources :users, only: [:index] do
    collection do
      post :set_push_token
      get :favorite_quotes
      get :view_counters
      get :get_partner
    end
  end

  resources :feelings, only: [:index] do
    collection do
      post :create_user_feeling
      get  :latest_feeling
      get  :user_feeling
    end
  end
end
