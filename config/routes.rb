Rails.application.routes.draw do
  root to: 'homes#top'
  resources :dream_lists
end
