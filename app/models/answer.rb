class Answer < ApplicationRecord
  has_many :answer_votes
  belongs_to :question

  def upvotes
    self.answer_votes.where(vote_type: 'UPVOTE').size
  end

  def downvotes
    self.answer_votes.where(vote_type: 'DOWNVOTE').size
  end
end
