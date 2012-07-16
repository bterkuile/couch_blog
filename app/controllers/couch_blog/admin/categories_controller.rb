module CouchBlog
  module Admin
    class CategoriesController < CouchBlog::Admin::ApplicationController

      # GET categories
      def index
        @categories = CouchBlog::Category.all
      end

      # GET admin/categories/new
      def new
        @category = CouchBlog::Category.new
      end

      # POST admin/categories
      def create
        @category = CouchBlog::Category.new(params[:category])
        if @category.save
          redirect_to([:admin, @category], notice: t('couch_blog.action.create.successful', model: CouchBlog::Category.model_name.human))
        else
          render action: :new
        end
      end

      # GET admin/categories/:id
      def show
        @category = CouchBlog::Category.find(params[:id])
      end

      # GET admin/categories/:id/edit
      def edit
        @category = CouchBlog::Category.find(params[:id])
      end

      # PUT admin/categories/:id
      def update
        @category = CouchBlog::Category.find(params[:id])
        if @category.update_attributes(params[:category])
          redirect_to([:admin, @category], notice: t('couch_blog.action.update.successful', model: CouchBlog::Category.model_name.human))
        else
          render action: :edit
        end
      end

      # DELETE admin/categories/:id
      def destroy
        @category = CouchBlog::Category.find(params[:id])
        @category.destroy
        redirect_to({action: :index}, notice: t('couch_blog.action.destroy.successful', model: CouchBlog::Category.model_name.human))
      end
    end
  end
end
