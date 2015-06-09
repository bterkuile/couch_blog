CouchBlog::Engine.routes.draw do
  #resources :posts, only: [:index, :show]
  namespace :admin do
    resources :posts
    resources :categories
    get "posts/:id(/:title)" => 'posts#show'
    root to: 'posts#index'
  end

  root to: 'posts#index'
  get "/posts/:id(/:title)" => 'posts#show', as: :post
end
