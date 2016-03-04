class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = 1
    if @question.save
      redirect_to @question
    else
      @errors = @question.errors.full_messages
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
