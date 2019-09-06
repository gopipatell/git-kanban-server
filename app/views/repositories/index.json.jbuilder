json.array! @repositories do |r|
  json.id r.id
  json.name r.name
  json.description r.description
  json.language r.language
  json.homepage r.homepage


  tasks = r.tasks
  json.set! :tasks do
    json.array! tasks do |t|
      json.description t.description
    end
  end
end
