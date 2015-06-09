module CouchBlog
  module Admin
    class ApplicationController < CouchBlog::ApplicationController
      before_filter :check_authorization, :set_couch_blog_admin_locale
      layout :couch_blog_layout


    private
      def couch_blog_layout
        defined?(Cmtool) ? 'cmtool/application' : 'couch_blog/admin/application'
      end

      def check_authorization
        if defined?(couch_blog_authorization)
          couch_blog_authorization
        elsif defined?(Cmtool)
          authorize_cmtool
        end
      end

      def set_couch_blog_admin_locale
        if respond_to?(:couch_blog_locale)
          I18n.locale = couch_blog_locale 
        elsif respond_to?(:cmtool_locale)
          I18n.locale = cmtool_locale
        else
          I18n.locale = :en
        end
      end
    end
  end
end
