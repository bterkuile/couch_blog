module CouchBlog
  class PostsController < CouchBlog::ApplicationController

    # GET posts
    def index
      @posts = CouchBlog::Post.all + [CouchBlog::Post.new(title: 'Tester', date: Date.today, body: 'Hol')]
    end

    #GET posts/:id(/:title)
    def show
      @post = CouchBlog::Post.find(params[:id])
    end
  end
end
