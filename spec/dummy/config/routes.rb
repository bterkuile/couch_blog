Rails.application.routes.draw do

  mount CouchBlog::Engine => "/blog"
end
