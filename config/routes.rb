Rails.application.routes.draw do
  root to: 'homes#top'
  resources :dream_lists
  get '/search_dream_list' => 'dream_lists#search_dream_list' # カテゴリー検索
end
