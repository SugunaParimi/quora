require "application_system_test_case"

class QuestionVotesTest < ApplicationSystemTestCase
  setup do
    @question_vote = question_votes(:one)
  end

  test "visiting the index" do
    visit question_votes_url
    assert_selector "h1", text: "Question votes"
  end

  test "should create question vote" do
    visit question_votes_url
    click_on "New question vote"

    fill_in "Question id", with: @question_vote.question_id
    fill_in "Vote type", with: @question_vote.vote_type
    click_on "Create Question vote"

    assert_text "Question vote was successfully created"
    click_on "Back"
  end

  test "should update Question vote" do
    visit question_vote_url(@question_vote)
    click_on "Edit this question vote", match: :first

    fill_in "Question id", with: @question_vote.question_id
    fill_in "Vote type", with: @question_vote.vote_type
    click_on "Update Question vote"

    assert_text "Question vote was successfully updated"
    click_on "Back"
  end

  test "should destroy Question vote" do
    visit question_vote_url(@question_vote)
    click_on "Destroy this question vote", match: :first

    assert_text "Question vote was successfully destroyed"
  end
end
