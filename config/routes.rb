Rails.application.routes.draw do
  resources :categories
  # Admin Routes
  authenticated :user, ->(user) { user.admin? } do 
    get 'admin', to: 'admin#index'
    get 'admin/posts'
    get 'admin/comments'
    get 'admin/users'
    get 'admin/show_post/:id', to: 'admin#show_post', as: 'admin_post'
  end

  resources :people
  get 'users/profile'
  devise_for :users
  # get '/user/:id', to: "users#profile", as: 'user'

  resources :users

  # /posts/1/comments/4
  resources :posts do 
    resources :comments
  end

  get 'pages/about', to: "pages#about";
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
