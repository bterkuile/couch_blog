module CouchBlog
  module Admin
    class ApplicationController < CouchBlog::ApplicationController
      before_filter :check_authorization

      private

      def check_authorization
        couch_blog_authorization if defined?(couch_blog_authorization)
      end
    end
  end
end
