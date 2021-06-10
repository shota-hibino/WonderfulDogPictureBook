Rails.application.routes.draw do
  namespace :public do
    resources :homes,only:[:top, :about]
    resources :searches,only:[:index, :search]
    resources :dog_breeds,only:[:index, :show]
    resources :members,only:[:show, :edit, :update, :secession_view, :secession]
    root to: "public/homes#top", as: "top"
  end

  namespace :admin do
    resources :searches,only:[:index, :search]
    resources :genres,only:[:index, :create, :edit, :update]
    resources :dog_breeds,only:[:index, :new, :create, :show, :edit, :update]
    resources :members,only:[:index, :show, :edit, :update]
  end

  devise_for :members, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }

  devise_for :admins, controllers: {
    sessions: 'admin/sessions',
  }

  root to: "public/homes#top", as: "top"
  get "public/home/about" => "public/homes#about" ,as: "about"


end
