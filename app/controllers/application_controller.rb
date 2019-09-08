class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false #This is required for APIs

end
