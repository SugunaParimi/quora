# == Schema Information
#
# Table name: question_votes
#
#  id          :bigint           not null, primary key
#  vote_type   :string
#  question_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class QuestionVoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
