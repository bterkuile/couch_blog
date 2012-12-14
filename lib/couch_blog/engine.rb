module CouchBlog
  class Engine < ::Rails::Engine
    isolate_namespace CouchBlog
    initializer 'couch_blog.cmtool', after: 'cmtool.build_menu' do
      if defined? Cmtool
        require 'cmtool'
        Cmtool::Menu.register do
          append_to :publications do
            resource_link CouchBlog::Post, scope: CouchBlog::Admin, engine: CouchBlog::Engine

          end
        end
      end
    end
  end
end
