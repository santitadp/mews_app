Rails.application.routes.draw do
  root 'welcome#index'

  get '/main', to: 'main#show'
  get '/politics', to: 'politics#show'
  get '/sports', to: 'sports#show'
  get '/science_tech', to: 'science_tech#show'
  get '/entertainment', to: 'entertainment#show'
end
