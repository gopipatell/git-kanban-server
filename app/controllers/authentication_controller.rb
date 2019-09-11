class AuthenticationController < ApplicationController

  def github
    authenticator = Authenticator.new

    access_code = authenticator.get_access_code(params[:code])

    graphql = authenticator.get_github_graphql(access_code)

    user = graphql['data']['viewer']
    repositories = user['repositories']['nodes']

    u = User.where(:github_name => user['login']).first_or_create!(
       name: user['name'],
       github_name: user['login'],
       image: user['avatarUrl']
    )

    repositories.each do |r|
      puts "REPO NAME: [#{r['name']}]"

      repo = Repository.where(:namewithowner =>
      # save each repository of user
       r['nameWithOwner']).first_or_create!(
          name: r['name'],
          namewithowner: r['nameWithOwner'],
          description: r['description'],
          homepage: r['homepageUrl']
      )

      # save collaborator of repository
      Collaborator.where(:user_id => u['id'], :repository_id => repo['id']).first_or_create!(
        user_id: u['id'],
        repository_id: repo['id']
      )


      task_count = Task.where(:status => "1", :repository_id => repo.id).count

      # save each issues from the repository
      r['issues']['nodes'].each do |issue|
        Task.where(:github_id => issue['id']).first_or_create!(
          github_id: issue['id'],
          title: issue['title'],
          description: issue['bodyText'],
          repository_id: repo.id,
          user_id: u.id,
          status: "1",
          task_index: task_count
        )
        task_count += 1
      end

    end

    token = TokiToki.encode(user['login'], user['name'], user['avatarUrl'])

    redirect_to "#{issuer}/silent_renew.html?token=#{token}"
  rescue StandardError => error
    redirect_to "#{issuer}?error=#{error.message}"
  end

  private

  def issuer
    ENV['GITKANBAN_CLIENT_URL']
  end
end
