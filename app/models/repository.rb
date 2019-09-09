# == Schema Information
#
# Table name: repositories
#
#  id            :bigint           not null, primary key
#  user_id       :integer
#  name          :string
#  description   :text
#  language      :string
#  homepage      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  namewithowner :string
#

class Repository < ApplicationRecord
  has_many :tasks
  has_many :collaborators
  has_many :users, through: :collaborators
end
