Rails.application.routes.draw do
  
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    resources :customers, only:[:show, :edit, :update]
    resources :communities
    resources :registration_communities, only:[:index, :destroy]
    resources :posts, only:[:create, ]
  namespace :public do
    get 'posts/show'
    get 'posts/edit'
  end

  
  
 end





devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :admin do
    get 'registration_communities/index'
  end
  namespace :admin do
    get 'communities/new'
    get 'communities/index'
    get 'communities/show'
    get 'communities/edit'
  end
  namespace :admin do
    get 'customers/show'
    get 'customers/edit'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
