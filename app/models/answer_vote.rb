# == Schema Information
#
# Table name: answer_votes
#
#  id         :bigint           not null, primary key
#  vote_type  :string
#  answer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AnswerVote < ApplicationRecord
  belongs_to :answer
  belongs_to :user
end
