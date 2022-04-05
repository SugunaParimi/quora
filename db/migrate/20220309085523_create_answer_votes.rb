class CreateAnswerVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :answer_votes do |t|
      t.string :vote_type
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
