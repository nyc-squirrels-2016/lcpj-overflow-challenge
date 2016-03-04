class AnswersController < ApplicationController

  def new
    question = Question.find(params[:question_id])
    @answer = question.answers.new
  end

  def create
    if logged_in?
      question = Question.find(params[:question_id])
      @answer = question.answers.new(answer_params)
      @answer.user_id = session[:user_id]
      @answer.question_id = question.id
      if @answer.save
        redirect_to question_path(question)
      else
        # @errors = @answer.errors.full_messages
        render :new
      end
    else
      redirect_to login_path
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    unless @answer.user_id == session[:user_id]
      redirect_to login_path
    end
  end

  def update
    find_question_for_answer
    if logged_in? && @answer.user.id == current_user.id
      if @answer.update(answer_params)
        redirect_to question_path(@question)
      else
        # @errors = @answer.errors.full_messages
        render :edit
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    find_question_for_answer
    if logged_in? &&& @answer.user.id == current_user.id
      @answer.destroy
      redirect_to question_path(@question)
    else
      redirect_to login_path
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def find_question_for_answer
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end
end
