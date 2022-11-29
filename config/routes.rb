Rails.application.routes.draw do

devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  scope module: :public do
    root to: 'homes#top'
    get "/about" => "homes#about" , as: "about"
    get 'customers/my_page' => "customers#index", as: "my_page"
    get 'customers/information/edit' => "customers#edit", as: "information"
    resources :deliverys, only: [:index, :show, :new, :create, :destroy]
    resources :customers, only: [:update, :show]
    resources :orders
    resources :posts, only: [:index, :show, :create]
    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show,:destroy]
    post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
    resources :notifications, only: [:index]
  end

  namespace :admin do

  end



  resources :maps, only: [:index]
  #get '/index2' => 'maps#index2', as: "map2"

  get '/map_request', to: 'maps#map', as: 'map_request'
end
