# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
puts "Creating Users..."

# u1 = User.create :name => "Gopi", :email => "gopi@ga.com", :github_name => "gopipatell"
u2 = User.create :name => "Paulina", :email => "paulina@ga.com", :github_name => "pkijowska"

Repository.destroy_all
puts "Creating Repository..."

r1 = Repository.create :name => "burning airlines", :description => "sample data", :language => "ruby", :homepage => ""

r2 = Repository.create :name => "mind-meet", :description => "sample data", :language => "ruby and bootstrap", :homepage => ""

Task.destroy_all
puts "Creating Task..."

t1 = Task.create :title => "This is a sample task", :description => "Sample task description...", :status => "1", :due_date => "2019-09-01", :task_index => "1"

t2 = Task.create :title => "This is a sample task2", :description => "description is very long..", :status => "2", :due_date => "2019-09-21", :task_index => "2"



puts "Creating Associations..."


r1.tasks << t1
r1.tasks << t2

u2.tasks << t1
u2.tasks << t2

u2.repositories << r1 << r2
