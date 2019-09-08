class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false #This is required for APIs


  def current_user
     payload = TokiToki.decode(bearer_token)
     @current_user ||= User.find_by :github_name => payload[0]['sub']
   end

   def logged_in?
     current_user != nil
   end

   def authenticate_user!
     head :unauthorized unless  !bearer_token.nil? && logged_in?
   end

   private
   def bearer_token
     pattern = /^Bearer /
     header  = request.headers["Authorization"] # <= env
     header.gsub(pattern, '') if header && header.match(pattern)
   end

end
