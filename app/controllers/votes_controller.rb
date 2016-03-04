class VotesController < ApplicationController
  def create
    if params[:question_id]
      @question = Question.find(params[:question_id])
      if logged_in?
        if @question.has_not_been_rated_by_user(current_user)
          vote = @question.votes.new(direction_value: params[:vote][:direction_value])
          vote.user = current_user
          if vote.save
            redirect_to @question
          else
            redirect_to @question
          end
        else
          redirect_to @question
        end
      else
        redirect_to login_path
      end
    else
      @answer = Answer.find(params[:answer_id])
      if logged_in?
        if @answer.has_not_been_rated_by_user(current_user)
          vote = @answer.votes.new(direction_value: params[:vote][:direction_value])
          vote.user = current_user
          if vote.save
            redirect_to @answer.question
          else
            redirect_to @answer.question
          end
        else
          redirect_to @answer.question
        end
      else
        redirect_to login_path
      end
    end
  end
end
