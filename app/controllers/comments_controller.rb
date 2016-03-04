class CommentsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @comment = @question.comments.new
  end

  def create
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
