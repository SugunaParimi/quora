require 'rails_helper'

RSpec.describe QuestionVote, type: :model do
  subject {
    question = Question.create(description: "sample question")
    QuestionVote.new(question: question)
}
  it "validate UPVOTE constant" do 
    expect(UPVOTE).to eq("UPVOTE")
  end

  it "validate DOWNVOTE constant" do 
    expect(DOWNVOTE).to eq("DOWNVOTE")
  end

  it ":vote_type should have valid values" do
    [UPVOTE, DOWNVOTE].each do |v|
      should allow_value(v).for(:vote_type)
    end
  end
end
