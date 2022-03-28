class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy upvote downvote ]
  before_action :set_current_user
  # GET /questions or /questions.json
  def index
    @questions = Question.where(user: current_user)
    @question = Question.new(user: current_user)
  end

  # GET /questions/1 or /questions/1.json
  def show
    if @question.user == current_user
      @answers = @question.answers
      @answer = Answer.new(user: current_user)
    else
      redirect_to questions_path, alert: "There is no Question with id #{@question.id}." 
    end
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to questions_path, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "Question was successfully updated." }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy

    respond_to do |format|
      format.html { redirect_to questions_url, notice: "Question was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def upvote
    @question.question_votes.create(vote_type: "UPVOTE");
    redirect_to questions_path
  end

  def downvote
    @question.question_votes.create(vote_type: "DOWNVOTE");
    redirect_to questions_path
  end

private
  def set_current_user
    @current_user = current_user
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:description, :user_id)
  end
end
