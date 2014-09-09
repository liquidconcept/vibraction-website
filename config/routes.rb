Rails.application.routes.draw do
  devise_for :users, :path => "admin", :controllers => { :sessions => "users/sessions" }, skip: 'registration'

  resource :admin, controller: 'admins', only: [:show] do
    collection { post :import }
  end

  get '' => 'statics#show', as: 'root'
  get '*page' => 'statics#show'
end
