class QuestionVotesController < ApplicationController
  before_action :set_question_vote, only: %i[ show edit update destroy ]

  # GET /question_votes or /question_votes.json
  def index
    @question_votes = QuestionVote.all
  end

  # GET /question_votes/1 or /question_votes/1.json
  def show
    
  end

  # GET /question_votes/new
  def new
    @question_vote = QuestionVote.new
  end

  # GET /question_votes/1/edit
  def edit
  end

  # POST /question_votes or /question_votes.json
  def create
    @question_vote = QuestionVote.new(question_vote_params)

    respond_to do |format|
      if @question_vote.save
        format.html { redirect_to question_vote_url(@question_vote), notice: "Question vote was successfully created." }
        format.json { render :show, status: :created, location: @question_vote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_votes/1 or /question_votes/1.json
  def update
    respond_to do |format|
      if @question_vote.update(question_vote_params)
        format.html { redirect_to question_vote_url(@question_vote), notice: "Question vote was successfully updated." }
        format.json { render :show, status: :ok, location: @question_vote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_votes/1 or /question_votes/1.json
  def destroy
    @question_vote.destroy

    respond_to do |format|
      format.html { redirect_to question_votes_url, notice: "Question vote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_vote
      @question_vote = QuestionVote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_vote_params
      params.require(:question_vote).permit(:vote_type, :question_id, :user_id)
    end
end
