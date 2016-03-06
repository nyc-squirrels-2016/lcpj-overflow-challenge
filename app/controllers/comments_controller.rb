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
    if logged_in?
      if params[:question_id]
        @question = Question.find(params[:question_id])
        create_comments(@question)
      else
        @answer = Answer.find(params[:answer_id])
        create_comments(@answer)
      end
    else
      redirect_to login_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def create_comments(value)
    @comment = value.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      if value.is_a?(Answer)
        redirect_to question_path(value.question)
      else
        redirect_to question_path(params[:question_id])
      end
    else
      @errors = @answer.errors.full_messages
      render :new
    end
  end

end
