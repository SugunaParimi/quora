require 'rails_helper'

RSpec.describe Question, type: :model do
  it 'description should have minimum 20 characters' do
   question = Question.new(description: "first question")
   expect(question).to_not be_valid
  end
end
