Rails.application.routes.draw do
  devise_for :users, :path => "admin", :controllers => { :sessions => "users/sessions" }, skip: 'registration'

  resource :admin, controller: 'admin/dashboards', only: [:show]

  get '' => 'statics#show', as: 'root'
  get '*page' => 'statics#show'
end
