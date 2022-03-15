json.extract! question_vote, :id, :vote_type, :question_id, :created_at, :updated_at
json.url question_vote_url(question_vote, format: :json)
