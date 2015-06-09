class ApplicationController < ActionController::Base
  protect_from_forgery

  #def couch_blog_authorization
    #render nothing: true, status: :forbidden unless current_user.present? && current_user.is_admin?
  #end
  def authorize_cmtool
    true
  end
end
