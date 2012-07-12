CouchBlog::Engine.routes.draw do
  resources :posts, only: [:index, :show]
  namespace :admin do
    resources :posts
    root to: 'posts#index'
  end

  root to: 'posts#index'
  get "posts/:id(/:title)" => 'posts#show'
end
