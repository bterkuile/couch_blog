require 'couch_blog/application_helper'
module CouchBlog
  module ApplicationHelper
    include Dummy::Application.routes.url_helpers
  end
end
