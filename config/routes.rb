FanClub::Application.routes.draw do

  resources :notifications
  
  match 'calificacion/:noticia/nueva' => 'calificacions#create', :via => :post
  
  
  match 'notificaciones' => 'notifications#index', :as => :notificaciones, :via => :get
  
  match 'nuevas_notificaciones' => 'notifications#nuevas_notificaciones',:via => :get
  
  resources :comments
  
  match 'comments/:id/delete/:noticia' => 'comments#destroy', :via => :get
  

  match 'videos' => 'videos#index', :as => :videos, :via => :get
  
  match 'mis_videos' => 'videos#mis_videos', :as => :mis_videos, :via => :get
  
  match 'videos' => 'videos#create', :as => :videos, :via => :post
  
  match 'videos/new' => 'videos#new', :as => :new_video, :via => :get

  match 'videos/:id/delete' => 'videos#destroy', :via => :get
  
  match 'videos/:id/edit' => 'videos#edit', :as => :edit_video, :via => :get
  
  match 'videos/:id/edit' => 'videos#update', :via => :post
    
  
  
  match 'noticias' => 'noticia#index', :as => :noticias, :via => :get
  
  match 'noticia' => 'noticia#create', :via => :post
  
  match 'noticias/new' => 'noticia#new', :as => :new_noticium, :via => :get
  
  match 'noticias/:id/edit' => 'noticia#edit', :as => :edit_noticium, :via => :get
  
  match 'noticias/:id' => 'noticia#show', :as => :noticium, :via => :get
  
  match 'noticias/:id' => 'noticia#update', :via => :put
  
  match 'mis_noticias' => 'noticia#mis_noticias', :as => :mis_noticias, :via => :get
  
  match 'noticia/:id/delete' => 'noticia#destroy', :via => :get

  match 'noticia/comentar' => 'noticia#comentar', :via => :post

  match 'comentario/:id/delete' => 'comments#destroy', :via => :get



  match 'imagenes' => 'imagens#index', :as => :imagenes, :via => :get
  
  match 'imagenes' => 'imagens#create', :via => :post
  
  match 'imagenes/new' => 'imagens#new', :as => :new_imagen, :via => :get

  match 'mis_imagenes' => 'imagens#mis_imagenes', :as => :mis_imagenes, :via => :get
  
  match 'imagenes/:id/delete' => 'imagens#destroy', :via => :get

  
  


  match 'personas' => 'personas#index', :as => :personas, :via => :get
  
  match 'registro' => 'personas#new', :as => :registro, :via => :get
  
  match 'personas' => 'personas#create', :via => :post
  
  match 'personas/:id/edit' => 'personas#edit', :as => :edit_persona, :via => :get
 
  match 'personas/:id' => 'personas#show', :as => :persona, :via => :get
  
  match 'personas/:id' => 'personas#update', :via => :put
  
  match 'personas/:id/delete' => 'personas#destroy', :via => :get
  
  
  
    
  match 'thanks' => 'personas#thanks', :as => :thanks, :via => :get
  
  match 'personas/:id/activate' => 'personas#activate', :as => :activate_persona, :via => :get

  match 'error_activation' => 'personas#error_activation', :as => :error_activation, :via => :get

  match 'invalid_code' => 'personas#invalid_code', :as => :invalid_code, :via => :get

  match 'change_password' => 'personas#change_password', :as => :change_password, :via => :get
  
  
  
  
  match 'password/:id' => 'password#edit', :as => :password, :via => :get

  match 'password' => 'password#update', :as => :password, :via => :put
  
  
  
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
  end

  get "sessions/create"

  match 'logout' => 'sessions#destroy', :as => :logout, :via => :get
  
  match 'start' => 'inicio#start', :as => :start, :via => :get
  
  match 'admin' => 'admin#index', :as => :dmin, :via => :get



  root :to => 'inicio#start'
end
