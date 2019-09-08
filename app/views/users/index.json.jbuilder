json.array! @users do |u|
  json.name u.name
  json.email u.email
  json.github_name u.github_name



  repositories = u.repositories
  json.set! :repositories do
    json.array! tasks do |r|
      json.name r.name
      json.description r.description
      json.language r.language
      json.homepage r.homepage
    end
  end
end
