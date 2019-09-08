json.set! :user do
  json.id @user.id
  json.name @user.name
  json.email @user.email
  json.github_name @user.github_name

  repositories = @user.repositories
  json.set! :repositories do
    json.array! repositories do |r|
      json.id r.id
      json.name r.name
      json.description r.description
      json.language r.language
      json.homepage r.homepage
    end
  end
end
