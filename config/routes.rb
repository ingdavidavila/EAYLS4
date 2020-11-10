Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'acercade', to: 'pages#acercade'
  get 'deportes', to: 'pages#deportes'
  get 'sociales', to: 'pages#sociales'
  get 'clasificados', to: 'pages#clasificados'
  get 'otaku', to: 'pages#otaku'
  get 'registrarse', to: 'users#new'
  get 'ingresar', to: 'session#nueva'
  post 'ingresar', to: 'session#crear'
  delete 'cerrarsesion', to: 'session#destruir'
  get 'buscar', to: 'pages#buscar'
  resources :articulos
  resources :users, except: [:new]
  resources :image_elements
  resources :avatar_elements
end
