class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = 1
    if @answer.save
      redirect_to @answer
    else
      @errors = @answer.errors.full_messages
      render :new
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
