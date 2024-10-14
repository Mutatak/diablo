Rails.application.routes.draw do
  get 'papers/new'
  get "up" => "rails/health#show", as: :rails_health_check

  root "articles#index"

  devise_for :users

  resources :articles do
    resources :comments
  end

  get 'new_text_comparison', to: 'texts#new'
  post 'check_similarity', to: 'texts#check_similarity'
  get 'show_similarity/:similarity_score', to: 'texts#show_similarity', as: 'show_similarity'
  get 'new_paper_search', to: 'papers#new'
  get 'search_paper', to: 'papers#search_paper'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
