Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "articles#index"

  devise_for :users

  resources :articles do
    resources :comments
  end

  get 'new_text_comparison', to: 'texts#new'
  post 'check_similarity', to: 'texts#check_similarity'
  get 'show_similarity/:similarity_score', to: 'texts#show_similarity', as: 'show_similarity'

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
