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
  end

  resources :users, only: [:index] do
    post :set_push_token, on: :collection
  end
end
