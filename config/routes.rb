Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  resources :worlds, only: [:index, :show]
  get '/user_quizzes/:id/result', to: 'quizzes#result', as: 'quiz_result'
  resources :user_lessons, only: [:show, :create, :update]
  resources :user_quizzes, only: [:show, :create, :update] do
    resources :questions, only: [:show, :create ]
  end
  resources :user_worlds, only: [:show]
  get '/profile', to: 'pages#profile'
  get '/ranking', to: 'pages#ranking'

end
