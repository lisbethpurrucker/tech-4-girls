# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/worlds', to: 'worlds#index'
  get '/profile', to: 'pages#profile'
  get '/ranking', to: 'pages#ranking'
  get '/:user_name/lessons/:lesson', to: 'user_lessons#show', as: 'user_lesson'
  get '/:user_name/quizzes/:quiz/result', to: 'user_quizzes#result', as: 'user_quiz_result'
  get '/:user_name/quizzes/:quiz', to: 'user_quizzes#show', as: 'user_quiz'
  get '/:name', to: 'worlds#show', as: 'world'
end
