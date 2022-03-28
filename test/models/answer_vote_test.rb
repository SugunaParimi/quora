# == Schema Information
#
# Table name: answer_votes
#
#  id         :bigint           not null, primary key
#  vote_type  :string
#  answer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class AnswerVoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
