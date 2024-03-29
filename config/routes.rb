Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "pages#home"
  get '/about', to: 'pages#about'
  get '/gallery', to: 'pages#gallery'
  get '/contact', to: 'pages#contact'
  get 'cubed/:num', to: 'main#cubed'
  get 'evenly/:num1/:num2', to: 'main#evenly'
  get 'palindrome/:string', to: 'main#palindrome'
  get 'random/:num1/:num2', to: 'main#random'
  get 'madlib/:adjective1/:adverb1/:verb/:adverb2/:adjective2', to: 'main#madlib'
end
