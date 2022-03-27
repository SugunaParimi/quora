
class QuestionVote < ApplicationRecord
  belongs_to :question
  validates :vote_type, inclusion: {in: [UPVOTE, DOWNVOTE]}
end
