# == Schema Information
#
# Table name: answers
#
#  id          :bigint           not null, primary key
#  description :text
#  question_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Answer < ApplicationRecord
  has_many :answer_votes
  belongs_to :question
  belongs_to :user
  def has_more_than_one_vote? user
    self.answer_votes.where(user: user).size > 0
end

def delete_votes(user)
    self.answer_votes.where(user: user_id).destroy_all
end

def upvote(user)
    self.answer_votes.create(vote_type: "UPVOTE", user: user)
end
def downvote(user)
  self.answer_votes.create(vote_type: "DOWNVOTE", user: user)
end
  def upvotes
    self.answer_votes.where(vote_type: 'UPVOTE').size
  end

  def downvotes
    self.answer_votes.where(vote_type: 'DOWNVOTE').size
  end
end
