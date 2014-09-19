Rails.application.routes.draw do

  root :to => 'sessions#new'

  resources :sessions, :except => [:show, :edit, :update, :index]

  resources :users, :except => [:index] do
    resources :tweets
    resources :follows, :except => [:update, :edit, :show]
  end

end
