class VotesController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id
    @survey = Survey.find(params[:survey_id])
    if @vote.save
      flash[:info] = "Voted"
    else
      flash[:danger] = "alredy voted"
    end
    redirect_to @survey
  end

  private
    def vote_params
      params.permit(:survey_id,
                    :vote_type)
    end
end
