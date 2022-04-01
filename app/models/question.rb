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

    def has_more_than_one_vote? user
        self.question_votes.where(user: user).size > 0
    end

    def delete_votes(user)
        self.question_votes.where(user: user_id).destroy_all
    end

    def upvote(user)
        self.question_votes.create(vote_type: "UPVOTE", user: user)
    end

    def upvotes
        self.question_votes.where(vote_type: 'UPVOTE').size
    end
    
    def downvote(user)
        self.question_votes.create(vote_type: "DOWNVOTE", user: user)
    end

    def downvotes
        self.question_votes.where(vote_type: 'DOWNVOTE').size
    end
end
