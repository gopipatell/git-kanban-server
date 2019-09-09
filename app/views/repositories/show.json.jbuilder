# frozen_string_literal: true

json.set! :repository do
  json.id @repository.id
  json.name @repository.name
  json.description @repository.description
  json.language @repository.language
  json.homepage @repository.homepage

  tasks = @repository.tasks
  json.set! :tasks do
    json.array! tasks do |t|
      json.id t.id
      json.title t.title
      json.description t.description
      json.status t.status
      json.due_date t.due_date
      json.user t.user
    end
  end

  users = @repository.users
  json.set! :users do
    json.array! users do |u|
      json.id u.id
      json.name u.name
      json.github_name u.github_name
      json.image u.image
    end
  end

end
