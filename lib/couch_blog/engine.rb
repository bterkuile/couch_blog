module CouchBlog
  class Engine < ::Rails::Engine
    isolate_namespace CouchBlog
    initializer 'couch_blog.cmtool', after: 'cmtool.build_menu' do
      if defined? Cmtool
        require 'cmtool'
        Cmtool::Menu.register do
          append_to :publications do
            resource_link CouchBlog::Post, scope: CouchBlog::Admin, engine: CouchBlog::Engine, label: :couch_blog_posts
          end
        end
        CouchBlog::Post.has_and_belongs_to_many :keywords, storing_keys: true, class_name: 'Cmtool::Keyword'
        Cmtool::Keyword.has_and_belongs_to_many :posts, class_name: 'CouchBlog::Post'
      end
    end
  end
end
