class VotesController < ApplicationController
  def create
    if logged_in?
      if params[:question_id]
        @question = Question.find(params[:question_id])
        create_votes(@question)
      else
        @answer = Answer.find(params[:answer_id])
        create_votes(@answer)
      end
    else
      redirect_to login_path
    end
  end

  private
  def create_votes(value)
    if value.has_not_been_rated_by_user(current_user)
      vote = value.votes.new(direction_value: params[:vote][:direction_value])
      vote.user = current_user
      vote.save
    end
    if value.is_a?(Answer)
      redirect_to value.question
    else
      redirect_to value
    end
  end
end
