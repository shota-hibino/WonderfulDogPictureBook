Rails.application.routes.draw do
  devise_for :members, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
  }

  root to: "public/homes#top", as: "top"
  get "public/home/about" => "public/homes#about" ,as: "about"

  namespace :public do
    put "/members/:id/secession_view" => "members#secession_view", as: 'members_secession_view'
    get "/members/:id/secession" => "members#secession", as: 'members_secession'
    resources :homes,only:[:top, :about]
    resources :searches,only:[:index, :search]
    resources :dog_breeds,only:[:index, :show] do
      resources :comments,only:[:create, :destroy]
    end

    get 'public/searches', to: 'searches#search'
    resources :members,only:[:show, :edit, :update, :secession_view]
    root to: "public/homes#top", as: "top"
  end

  namespace :admin do
    resources :genres,only:[:index, :create, :edit, :update, :destroy]
    resources :dog_breeds,only:[:index, :new, :create, :show, :edit, :update]
    resources :members,only:[:index, :show, :edit, :update]
  end
end
