class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    if logged_in?
      @question = Question.new
    else
      redirect_to login_path
    end
  end

  def create
    if logged_in?
      @question = Question.new(question_params)
      @question.user = current_user
      if @question.save
        redirect_to @question
      else
        @errors = @question.errors.full_messages
        render :new
      end
    else
      redirect_to login_path
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
      @question = Question.find(params[:id])
      unless logged_in? && @question.user == current_user
        redirect_to login_path
      end
  end

  def update
    @question = Question.find(params[:id])
    if logged_in? && @question.user == current_user
      if @question.update(question_params)
        redirect_to @question
      else
        @errors = @question.errors.full_messages
        render :edit
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if logged_in? && @question.user == current_user
      @question.destroy
      redirect_to '/'
    else
      redirect_to login_path
    end
  end

  def question_params
    params.require(:question).permit(:title, :body)
  end
end
