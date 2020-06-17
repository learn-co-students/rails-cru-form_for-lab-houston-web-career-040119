Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :artists, only: [:show,:edit,:update,:new,:create]
  resources :genres, only: [:show,:edit,:update,:new,:create]
  resources :songs, only: [:index,:show,:edit,:update,:new,:create]

end
