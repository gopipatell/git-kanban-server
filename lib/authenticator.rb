class Authenticator
  def initialize(connection = Faraday.new)
    @connection = connection
  end

  def github(code)
    access_token_resp = fetch_github_access_token(code)
    access_token = access_token_resp['access_token']

    user_info_resp = fetch_github_user_info(access_token)

    {
      issuer: ENV['GITKANBAN_CLIENT_URL'],
      github_name: user_info_resp['login'],
      name: user_info_resp['name'],
      email: user_info_resp['email'],
      image: user_info_resp['avatar_url']
    }
  end


  def get_access_code(code)
    fetch_github_access_token(code)['access_token']
  end

  def get_github_graphql(access_code)

    resp = @connection.post do |req|
      req.url ENV['GITHUB_GRAPHQL_URL']
      req.headers["Authorization"] = "Bearer #{access_code}"
      req.headers['Content-Type'] = 'application/json'
      req.body = "{ \"query\": \"#{github_graphql_query}\" }"
    end

    raise IOError, 'FETCH_USER_INFO' unless resp.success?

    JSON.parse(resp.body)
  end


  private

  def fetch_github_access_token(code)
    resp = @connection.post ENV['GITHUB_ACCESS_TOKEN_URL'], {
      code:          code,
      client_id:     ENV['CLIENT_ID'],
      client_secret: ENV['CLIENT_SECRET']
    }
    raise IOError, 'FETCH_ACCESS_TOKEN' unless resp.success?
    URI.decode_www_form(resp.body).to_h
  end

  def github_graphql_query
    "query { viewer { login name avatarUrl repositories(first: 100, privacy: PUBLIC) { nodes { name nameWithOwner homepageUrl description issues(first: 100) { nodes { id title bodyText closed author { login } } } owner { ... on User { login } } } } } } "
  end

end
