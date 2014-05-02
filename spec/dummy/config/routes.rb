Rails.application.routes.draw do
  devise_for :users

  mount CouchBlog::Engine => "/blog"
  #mount Cmtool::Engine => '/cmtool'
  get "/test" => "dashboard#test", as: 'test1'

  root to: "dashboard#test", as: 'test2'
end
