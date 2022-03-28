# == Schema Information
#
# Table name: questions
#
#  id          :bigint           not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Question < ApplicationRecord
    has_many :answers
    has_many :question_votes
    belongs_to :user

    validates :description, length: { minimum: 5 }
    def upvotes
        self.question_votes.where(vote_type: 'UPVOTE').size
    end

    def downvotes
        self.question_votes.where(vote_type: 'DOWNVOTE').size
    end
end
