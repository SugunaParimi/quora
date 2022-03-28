# == Schema Information
#
# Table name: question_votes
#
#  id          :bigint           not null, primary key
#  vote_type   :string
#  question_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class QuestionVote < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :vote_type, inclusion: {in: [UPVOTE, DOWNVOTE]}

end
