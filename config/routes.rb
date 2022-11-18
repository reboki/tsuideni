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
    get 'customers/my_page' => "customers#show", as: "my_page"
    get 'customers/information/edit' => "customers#edit", as: "information"
    resources :deliverys, only: [:index, :show]
    resources :customers, only: [:update]
    resources :orders
  end

  namespace :admin do

  end

end
