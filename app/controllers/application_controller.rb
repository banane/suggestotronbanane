# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
include AuthenticatedSystem

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

  def authenticated?
   if !logged_in?
     flash[:notice] = "You must login to do that"
     redirect_to root_path
     false
   end 
 end 

end
