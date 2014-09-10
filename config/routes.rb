Rails.application.routes.draw do
  devise_for :users, :path => "admin", :controllers => { :sessions => "users/sessions" }, skip: 'registration'

  resource :admin, controller: 'admins', only: [:show] do
    collection { post :import }
  end

  resource :static, only: [:create]

  get '' => 'statics#show', as: 'root'
  get '*page' => 'statics#show'
end
