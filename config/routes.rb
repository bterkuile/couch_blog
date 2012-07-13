CouchBlog::Engine.routes.draw do
  resources :posts, only: [:index, :show]
  namespace :admin do
    resources :posts
    get "posts/:id(/:title)" => 'admin/posts#show'
    root to: 'posts#index'
  end

  root to: 'posts#index'
  get "posts/:id(/:title)" => 'posts#show'
end
