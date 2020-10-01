Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks',sessions: 'sessions',registrations: 'registrations'}
  get "test/test_action"

end
