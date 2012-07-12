class ApplicationController < ActionController::Base
  protect_from_forgery

  def couch_blog_authorization
    #redirect_to '/blog'
  end
end
