FanClub::Application.routes.draw do

  get "inicio/start"

  match 'start' => 'inicio#start', :as => :start, :via => :get

  match 'logout' => 'admin#logout', :as => :logout, :via => :get

  match 'password/:id' => 'password#edit', :as => :password, :via => :get

  match 'password/:id' => 'password#update', :as => :password, :via => :post

  match 'registro' => 'personas#new', :as => :registro, :via => :get

  match 'thanks' => 'personas#thanks', :as => :thanks, :via => :get

  match 'error_activation' => 'personas#error_activation', :as => :error_activation, :via => :get

  match 'invalid_code' => 'personas#invalid_code', :as => :invalid_code, :via => :get

  match 'change_password' => 'personas#change_password', :as => :change_password, :via => :get



  resources :videos
  
  match 'mis_videos' => 'videos#mis_videos', :as => :mis_videos, :via => :get

  resources :tipo_usuario_funcionalidads


  resources :tipo_usuarios


  resources :funcionalidads


  resources :calificacions


  resources :noticia


  resources :imagens




  resources :personas

  
  
  resources :personas do
     get :activate, on: :member
  end
  
  get 'admin' => 'admin#index'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
  end
  get "admin/index"

  get "sessions/create"

  get "sessions/destroy"

  root :to => 'sessions#inicio'
end
