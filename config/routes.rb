Rails.application.routes.draw do
  
# 会員
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root :to =>'homes#top'
    resources :customers, only:[:show, :edit, :update]
    resources :communities
    resources :registration_communities, only:[:index, :destroy]
    resources :posts, only:[:create, :show, :edit, :update, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get "searches/search_community"=>'searches#search_community'
  end

# 管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root :to =>'homes#top'
    resources :customers, only:[:show, :edit, :update]
    resources :communities
    resources :registration_communities, only:[:index, :destroy]
    resources :posts, only:[:create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get "searches/search_community"=>'searches#search_community'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

