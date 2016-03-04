class CommentsController < ApplicationController
  def new
    if params[:question_id]
      @question = Question.find(params[:question_id])
      @comment = @question.comments.new
    else
      @answer = Answer.find(params[:answer_id])
      @comment = @answer.comments.new
    end
  end

  def create
    if params[:question_id]
      if logged_in?
        @question = Question.find(params[:question_id])
        @comment = @question.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
          redirect_to question_path(params[:question_id])
        else
          @errors = @question.errors.full_messages
          render :new
        end
      else
        redirect_to login_path
      end
    else
      if logged_in?
        @answer = Answer.find(params[:answer_id])
        @comment = @answer.comments.new(comment_params)
        @comment.user = current_user
        if @comment.save
          redirect_to question_path(@answer.question)
        else
          @errors = @answer.errors.full_messages
          render :new
        end
      else
        redirect_to login_path
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
