class AddUserToAnswerVotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :answer_votes, :user, null: true, foreign_key: true
  end
end
