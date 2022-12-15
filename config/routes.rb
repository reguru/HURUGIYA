Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :admin,skip:[:registrations,:passwords],controllers:{
    sessions:'admin/sessions',
  }

  devise_for :endusers,skip:[:passwords],controllers:{
    sessions:'public/sessions',
    registrations:'public/registrations',
  }

  scope module: :public do
    root to: 'homes#top'
    get 'endusers/mypage'=>'endusers#show'
    get 'endusers/mypage/edit'=>'endusers#edit'
    patch 'endusers/mypage'=>'endusers#update'
    get 'endusers/posts'=>'endusers#index'
    get 'endusers/quit'
    patch 'endusers/quit'=>'endusers#quit_update'

    get 'posts/map'

    resources :posts,only:[:new,:create,:show,:edit,:index,:update,:destroy]
    resources :favorites,only:[:create,:index]
    resources :bookmarks,only:[:create,:index]
  end

  namespace :admin do
    get '/'=>'homes#top'
    resources :endusers,only:[:show,:update]
    resources :comments,only:[:index,:destroy]
  end
end
