Rails.application.routes.draw do
  get '' => 'statics#show', as: 'root'
  get '*page' => 'statics#show'
end
