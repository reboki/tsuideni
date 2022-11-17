Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
  end
  namespace :public do
    get 'deliverys/index'
    get 'deliverys/show'
    get 'deliverys/new'
  end
  namespace :public do
    get 'delivery/index'
    get 'delivery/show'
    get 'delivery/new'
  end
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
  end

  namespace :admin do

  end

end
