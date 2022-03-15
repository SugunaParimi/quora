class CreateQuestionVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :question_votes do |t|
      t.string :vote_type
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
