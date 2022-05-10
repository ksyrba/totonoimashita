Rails.application.routes.draw do
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
  namespace :public do
    get 'posts/show'
    get 'posts/edit'
  end
  namespace :public do
    get 'registration_communities/index'
  end
  namespace :public do
    get 'communities/new'
    get 'communities/index'
    get 'communities/show'
    get 'communities/edit'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
  end
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
