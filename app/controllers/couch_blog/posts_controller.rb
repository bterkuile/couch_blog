module CouchBlog
  class PostsController < CouchBlog::ApplicationController

    # GET posts
    def index
      @posts = CouchBlog::Post.all
      render couch_blog_render if defined? couch_blog_render
    end

    #GET posts/:id(/:title)
    def show
      @post = CouchBlog::Post.find(params[:id])
      render couch_blog_render if defined? couch_blog_render
    end
  end
end
