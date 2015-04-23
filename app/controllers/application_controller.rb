class ApplicationController < ActionController::Base
  protect_from_forgery

   def set_blog_instance_variable
   @blog = true
   end
end
