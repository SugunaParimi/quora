class AddUserToQuestionVotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :question_votes, :user, null: true, foreign_key: true
  end
end
