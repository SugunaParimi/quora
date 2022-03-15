class AnswerVotesController < ApplicationController
  before_action :set_answer_vote, only: %i[ show edit update destroy ]

  # GET /answer_votes or /answer_votes.json
  def index
    @answer_votes = AnswerVote.all
  end

  # GET /answer_votes/1 or /answer_votes/1.json
  def show
  end

  # GET /answer_votes/new
  def new
    @answer_vote = AnswerVote.new
  end

  # GET /answer_votes/1/edit
  def edit
  end

  # POST /answer_votes or /answer_votes.json
  def create
    @answer_vote = AnswerVote.new(answer_vote_params)

    respond_to do |format|
      if @answer_vote.save
        format.html { redirect_to answer_vote_url(@answer_vote), notice: "Answer vote was successfully created." }
        format.json { render :show, status: :created, location: @answer_vote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answer_votes/1 or /answer_votes/1.json
  def update
    respond_to do |format|
      if @answer_vote.update(answer_vote_params)
        format.html { redirect_to answer_vote_url(@answer_vote), notice: "Answer vote was successfully updated." }
        format.json { render :show, status: :ok, location: @answer_vote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer_vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_votes/1 or /answer_votes/1.json
  def destroy
    @answer_vote.destroy

    respond_to do |format|
      format.html { redirect_to answer_votes_url, notice: "Answer vote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_vote
      @answer_vote = AnswerVote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_vote_params
      params.require(:answer_vote).permit(:vote_type, :answer_id)
    end
end
