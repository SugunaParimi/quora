require "application_system_test_case"

class AnswerVotesTest < ApplicationSystemTestCase
  setup do
    @answer_vote = answer_votes(:one)
  end

  test "visiting the index" do
    visit answer_votes_url
    assert_selector "h1", text: "Answer votes"
  end

  test "should create answer vote" do
    visit answer_votes_url
    click_on "New answer vote"

    fill_in "Answer id", with: @answer_vote.answer_id
    fill_in "Vote type", with: @answer_vote.vote_type
    click_on "Create Answer vote"

    assert_text "Answer vote was successfully created"
    click_on "Back"
  end

  test "should update Answer vote" do
    visit answer_vote_url(@answer_vote)
    click_on "Edit this answer vote", match: :first

    fill_in "Answer id", with: @answer_vote.answer_id
    fill_in "Vote type", with: @answer_vote.vote_type
    click_on "Update Answer vote"

    assert_text "Answer vote was successfully updated"
    click_on "Back"
  end

  test "should destroy Answer vote" do
    visit answer_vote_url(@answer_vote)
    click_on "Destroy this answer vote", match: :first

    assert_text "Answer vote was successfully destroyed"
  end
end
