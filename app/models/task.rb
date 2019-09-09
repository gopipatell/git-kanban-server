# == Schema Information
#
# Table name: tasks
#
#  id            :bigint           not null, primary key
#  user_id       :integer
#  repository_id :integer
#  description   :text
#  status        :string
#  due_date      :date
#  task_index    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  title         :string
#  github_id     :string
#

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :repository
end
