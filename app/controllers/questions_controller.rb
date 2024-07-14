class QuestionsController < ApplicationController
  #skip_before_action :verify_authenticity_token
  before_action :set_question, only: %i[update show destroy edit]

  def index
    @question = Question.new
    
    @questions = Question.all
  end

  def show
    # @question = Question.find(params[:id])
  end

  def create
    # question = Question.create(
    #   body: params[:question][:body],
    #   user_id: params[:question][:user_id]
    # )
    @question = Question.create(question_params)

    #flash[:notice] = 'New question was created'
    redirect_to question_path(@question), notice: 'New question was created!'
  end

  def update
    # question = Question.find(params[:id])

    # question.update(
    #   body: params[:question][:body],
    #   user_id: params[:question][:user_id]
    # )
    @question.update(question_params)

    redirect_to question_path(@question), notice: 'Question was saved!'
  end

  def destroy
    # @question = Question.find(params[:id])

    @question.destroy

    redirect_to questions_path, notice: 'Question was deleted!'
  end

  def new
    @question = Question.new
  end

  def edit
    # @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
