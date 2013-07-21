FanClub::Application.routes.draw do

  get "inicio/start"

  match 'start' => 'inicio#start', :as => :start, :via => :get

  match 'logout' => 'sessions#destroy', :as => :logout, :via => :get

  match 'password/:id' => 'password#edit', :as => :password, :via => :get

  match 'password/:id' => 'password#update', :as => :password, :via => :post

  match 'registro' => 'personas#new', :as => :registro, :via => :get

  match 'thanks' => 'personas#thanks', :as => :thanks, :via => :get

  match 'error_activation' => 'personas#error_activation', :as => :error_activation, :via => :get

  match 'invalid_code' => 'personas#invalid_code', :as => :invalid_code, :via => :get

  match 'change_password' => 'personas#change_password', :as => :change_password, :via => :get

  

  
  match 'videos' => 'videos#index', :as => :videos, :via => :get
  
  match 'mis_videos' => 'videos#mis_videos', :as => :mis_videos, :via => :get
  
  match 'videos' => 'videos#create', :as => :videos, :via => :post
  
  match 'videos/new' => 'videos#new', :as => :new_video, :via => :get

  match 'videos/:id/delete' => 'videos#destroy', :via => :get
  
  match 'videos/:id/edit' => 'videos#edit', :as => :edit_video, :via => :get
  
  match 'videos/:id/edit' => 'videos#update', :via => :post
    
  

  resources :noticia
  
  match 'noticias' => 'noticia#index', :as => :noticias, :via => :get
  
  match 'mis_noticias' => 'noticia#mis_noticias', :as => :mis_noticias, :via => :get
  
  match 'noticia/:id/delete' => 'noticia#destroy', :via => :get


  resources :imagens

  match 'imagenes' => 'imagens#index', :as => :imagenes, :via => :get

  match 'mis_imagenes' => 'imagens#mis_imagenes', :as => :mis_imagenes, :via => :get
  
  match 'imagenes/:id/delete' => 'imagens#destroy', :via => :get

  
  resources :personas
  
  resources :personas do
     get :activate, on: :member
  end
  
  
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
  end

  get "sessions/create"


  root :to => 'inicio#start'
end
