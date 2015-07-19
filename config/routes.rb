Rails.application.routes.draw do
  resources :candidates, only: [:index, :show, :create]
  root 'candidates#index'
end
