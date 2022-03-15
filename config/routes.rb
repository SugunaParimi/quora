Rails.application.routes.draw do
  resources :question_votes
  resources :answer_votes

  resources :answers do
    member do
      get 'upvote'
      get 'downvote'
    end
  end

  resources :questions do
    member do
      get 'upvote'
      get 'downvote'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "questions#index"
end
