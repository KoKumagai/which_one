class CommentsController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    @survey = Survey.find(params[:survey_id])
    @comment = @survey.comments.build(content: params[:comment][:content])
    @comment.user_id = current_user.id
    if @comment.save
      flash[:info] = "Comment posted"
      redirect_to @survey
    else
      flash[:danger] = "Comment can't be blank"
      redirect_to @survey
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end
end
