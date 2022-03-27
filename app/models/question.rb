class Question < ApplicationRecord
    has_many :answers
    has_many :question_votes
    validates :description, length: { minimum: 20 }
    def upvotes
        self.question_votes.where(vote_type: 'UPVOTE').size
    end

    def downvotes
        self.question_votes.where(vote_type: 'DOWNVOTE').size
    end
end
