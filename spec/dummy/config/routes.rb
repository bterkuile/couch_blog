Rails.application.routes.draw do
  devise_for :users

  mount CouchBlog::Engine => "/blog"
  match "/test" => "dashboard#test", as: 'test1'

  root to: "dashboard#test", as: 'test2'
end
