json.array! @tasks do |t|
  
  json.status t.status
  json.description t.description
  json.due_date t.due_date
  json.task_index t.task_index


  tasks = r.tasks
  json.set! :tasks do
    json.array! tasks do |t|
      json.description t.description
    end
  end
end
