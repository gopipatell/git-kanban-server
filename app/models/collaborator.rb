# == Schema Information
#
# Table name: collaborators
#
#  id            :bigint           not null, primary key
#  user_id       :integer
#  repository_id :integer
#


class Collaborator < ApplicationRecord
  belongs_to :user
  belongs_to :repository
end
