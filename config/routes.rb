Rails.application.routes.draw do
  resources :posts
  
  get '/', to: 'home#index', as: 'home'
end
