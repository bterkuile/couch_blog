module CouchBlog
  module Admin
    class PostsController < CouchBlog::Admin::ApplicationController

      # GET posts
      def index
        @posts = CouchBlog::Post.all
      end

      # GET admin/posts/new
      def new
        @post = CouchBlog::Post.new
      end

      # POST admin/posts
      def create
        @post = CouchBlog::Post.new(post_params)
        if @post.save
          redirect_to([:admin, @post], notice: t('couch_blog.action.create.successful', model: CouchBlog::Post.model_name.human))
        else
          render action: :new
        end
      end

      # GET admin/posts/:id
      def show
        @post = CouchBlog::Post.find(params[:id])
      end

      # GET admin/posts/:id/edit
      def edit
        @post = CouchBlog::Post.find(params[:id])
      end

      # PUT admin/posts/:id
      def update
        @post = CouchBlog::Post.find(params[:id])
        if @post.update_attributes(post_params)
          redirect_to([:admin, @post], notice: t('couch_blog.action.update.successful', model: CouchBlog::Post.model_name.human))
        else
          render action: :edit
        end
      end

      # DELETE admin/posts/:id
      def destroy
        @post = CouchBlog::Post.find(params[:id])
        @post.destroy
        redirect_to({action: :index}, notice: t('couch_blog.action.destroy.successful', model: CouchBlog::Post.model_name.human))
      end

      def post_params
        params.require(:post).permit(:title, :date, :body)
      end
    end
  end
end
