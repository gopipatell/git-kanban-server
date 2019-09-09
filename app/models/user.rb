# == Schema Information
#
# Table name: users
#
#  id          :bigint           not null, primary key
#  name        :string
#  email       :string
#  github_name :string
#  image       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class User < ApplicationRecord
  has_many :tasks
  has_many :collaborators
  has_many :repositories, through: :collaborators

end
