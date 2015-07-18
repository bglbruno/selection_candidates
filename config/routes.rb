Rails.application.routes.draw do
  get 'candidates_selection/index'
  root 'candidates_selection#index'
end
