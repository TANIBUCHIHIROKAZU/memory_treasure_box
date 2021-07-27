Rails.application.routes.draw do

  # deviseが複数あるため名称を変更する
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  # deviseが複数あるため名称を変更する
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    registrations: 'customers/registrations'
  }

  # namespaceでURLパスとファイルパスを変更する
  namespace :admin do
   resources :genres, only: [:index, :create, :destroy]
   resources :customers, only: [:index, :show, :update] do
      member do
      get 'memory_index'
      end
      collection do
      get "search"
      end
   end
   resources :informations
   resources :contacts, only: [:index, :destroy, :show]
   resources :memories, only: [:show, :destroy] do
    resources :comments,only: [:destroy]
   end
  end

  # moduleでURLは変更せず、ファイルパスを変更する
  scope module: :public do
   root 'homes#top'
   resources :memories,except: [:index] do
    resource :favorites,only: [:create, :destroy]
    resources :comments,only: [:create,:destroy]
   end
   resources :customers, only: [:index, :show, :update] do
    member do
      get 'memory_index'
    end
    collection do
      get "search"
    end
   end
   resources :contacts, only: [:new, :create] do
    member do
     get 'finish'
    end
    collection do
      post 'confirm'
      get 'confirm'
    end
   end
   resources :informations, only: [:index, :show]
   resources :orders, only: [:create] do
    collection do
     post 'confirmation'
     get 'confirmation'
    end
   end
   post 'follow/:id' => 'connections#create', as: 'follow' # フォローする
   post 'unfollow/:id' => 'connections#destroy', as: 'unfollow' # フォロー外す
   get 'orders/plan_order/:price_id/:plan_id' => 'orders#plan_order', as: 'plan_order'
   get 'memories' => 'memories#create', as: 'memory_create'

  get '/memory_tags/:customer_id/:memory_tag_id/tag_index' => 'memories#tag_index', as: 'tag_index'
  # get '/memory_tags/:memory_tag_id/tag_index' => 'memories#tag_index', as: 'tag_index'
  

  end
end
