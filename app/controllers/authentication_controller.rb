class AuthenticationController < ApplicationController
  def github
    authenticator = Authenticator.new
    user_info = authenticator.github(params[:code])

    github_name = user_info[:github_name]
    name = user_info[:name]
    image = user_info[:image]

    # Generate token...
    token = TokiToki.encode(github_name, name, image)
    # ... create user if it doesn't exist...
    User.where(:github_name => github_name).first_or_create!(
      name: name,
      github_name: github_name,
      image: image
    )

    # ... and redirect to client app.
    redirect_to "#{issuer}/silent_renew.html?token=#{token}"
  rescue StandardError => error
    redirect_to "#{issuer}?error=#{error.message}"
  end

  private

  def issuer
    ENV['GITKANBAN_CLIENT_URL']
  end
end
