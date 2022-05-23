Rails.application.routes.draw do

# 会員
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :customer do
    post 'public/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root :to =>'homes#top'
    resources :customers, only:[:show, :edit, :update]
    resources :communities do
      resources :customer_community, only:[:create]
      get "join" => "communities#join"
    end
    resources :registration_communities, only:[:index, :destroy]
    resources :post_actives, only:[:create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get "searches/search_community"=>'searches#search_community'
    get "searches/search_area"=>'searches#search_area'

  end

# 管理者
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :admin do
    post 'admin/guest_sign_in', to: 'admin/sessions#guest_sign_in'
  end

  namespace :admin do
    root :to =>'homes#top'
    resources :customers, only:[:index, :show, :edit, :update] do
      patch :unsubscribe, on: :member
    end
    resources :communities do
      resources :customer_community, only:[:create]
      get "join" => "communities#join"
    end
    resources :registration_communities, only:[:index, :destroy]
    resources :post_actives, only:[:create, :show, :edit, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get "searches/search_community"=>'searches#search_community'
    get "searches/search_area"=>'searches#search_area'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

