Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:'admin/sessions',
  }

  devise_for :users,controllers:{
    sessions:'public/sessions',
    registrations:'public/registrations',
    passwords:'public/passwords'
  }
  
  devise_scope :user do
    post 'users/guest_sign_in'=>'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root to: 'homes#top'
    get '/about'=>'homes#about'
    get 'users/mypage'=>'users#mypage'
    get 'users/mypage/edit'=>'users#edit'
    patch 'users/mypage'=>'users#update'
    get 'users/posts'=>'users#index'
    get 'users/quit'
    patch 'users/quit'=>'users#quit_update'
    
    get 'search' => 'searches#search'

    get 'posts/map'
    
    resources :users, only: [:new,:show] do 
      member do 
        get :favorites
      end
    end

    resources :posts,only:[:new,:create,:show,:edit,:index,:update,:destroy] do
      resource :favorites,only:[:create,:destroy]
      resource :bookmarks,only:[:create,:destroy]
      resources :comments,only:[:create,:destroy]
    end
    
    resources :bookmarks,only:[:index]
  end

  namespace :admin do
    get '/'=>'homes#top'
    resources :users,only:[:show,:update]
    resources :comments,only:[:index,:destroy]
  end
end
