Rails.application.routes.draw do
  resources :pages
  get '/search', to: 'pages#search'


  # get 'pages/:recipe', to: "pages#new", as: "pages_new"
  #
  # post 'pages/create'

end
