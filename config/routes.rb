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
   resources :genres, only: [:index, :create, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :news
   resources :contacts, only: [:index, :destroy, :show]
   resources :memories, only: [:new, :index, :show, :destroy]

  end
  
  # moduleでURLは変更せず、ファイルパスを変更する
  scope module: :public do
   root 'homes#top'
   resources :memories do
    resource :favorites,only: [:create, :destroy]
    resources :comments,only: [:create,:destroy]
   end
   resources :customers, only: [:index, :show, :update]
   resources :contacts, only: [:new, :create] do
    collection do
      get 'finish'
    end
   end
   resources :news, only: [:index, :show]
   resources :orders, only: [:new, :create] do
    collection do
     post 'confirmation'
    end
   end
   post 'follow/:id' => 'connections#create', as: 'follow' # フォローする
   post 'unfollow/:id' => 'connections#destroy', as: 'unfollow' # フォロー外す
   get 'follower_user/:id' => 'connections#follower_user', as: 'follower_user'
   get 'followed_user/:id' => 'connections#followed_user', as: 'followed_user'
   
  end
  
  
  
end
