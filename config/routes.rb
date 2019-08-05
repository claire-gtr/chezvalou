Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, skip: [:registrations]
  root to: 'pages#home'
  resources :blogposts, only: %i[show index]
  get 'mentions-legales', to: 'pages#legals'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
