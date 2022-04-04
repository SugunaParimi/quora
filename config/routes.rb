Rails.application.routes.draw do
  devise_for :users
  resources :question_votes
  resources :answer_votes

  resources :answers do
    member do
      get 'upvote'
      get 'downvote'
    end
  end

  resources :questions do
    collection do
      get 'all', to: "questions#all_questions"
    end
    member do
      get 'upvote'
      get 'downvote'
    end
  end

  get 'search', to: 'dashboard#search'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "questions#index"
end
