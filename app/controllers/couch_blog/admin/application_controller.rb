module CouchBlog
  module Admin
    class ApplicationController < CouchBlog::ApplicationController
      before_filter :check_authorization
      layout :couch_blog_layout


    private
      def couch_blog_layout
        defined?(Cmtool) ? 'cmtool/application' : 'couch_blog/admin/application'
      end

      def check_authorization
        couch_blog_authorization if defined?(couch_blog_authorization)
      end
    end
  end
end
