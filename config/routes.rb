Rails.application.routes.draw do
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  resources :users
  root to: 'homes#top'
  resources :dream_lists
  resources :plans
  resources :not_to_do_lists
  resources :searches, only:[:index]
  get '/search_dream_list' => 'dream_lists#search_dream_list' # カテゴリー検索
end
