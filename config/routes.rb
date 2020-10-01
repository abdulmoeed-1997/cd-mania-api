Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',sessions: 'sessions',registrations: 'registrations'}

  resources :users, only: [:index] do
    collection do
      get :profile
    end
  end

  get "test/test_action"

end
