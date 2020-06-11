Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :interview_preparations, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :missions, only: [:new, :create]
    resources :hardskills, only: [:new, :create, :show]
    resources :candidate_works, only: [:edit, :update]
    collection do
      get :scrap_articles
    end
    resources :challenges, only: [:create]
  end
end
