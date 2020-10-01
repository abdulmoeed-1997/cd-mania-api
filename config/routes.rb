Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'sessions',registrations: 'registrations'}
  get "test/test_action"

end
