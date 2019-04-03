Rails.application.routes.draw do
  root to: 'landing#home'

  resources :recipes, except: [:index, :destroy]

  resources :ingredients, except: [:index, :destroy]
end
