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

  def upvotes
    self.answer_votes.where(vote_type: 'UPVOTE').size
  end

  def downvotes
    self.answer_votes.where(vote_type: 'DOWNVOTE').size
  end
end
