class SurveysController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def index
    @surveys = Survey.page(params[:page]).per(15).order(created_at: :desc)
    @pictures = Picture.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = current_user.surveys.build(survey_params)
    if @survey.save
      @survey.pictures.build(uri: Picture.search(params[:survey][:first_word]), picture_type: 1).save
      @survey.pictures.build(uri: Picture.search(params[:survey][:second_word]), picture_type: 2).save
      flash[:info] = 'Survey created'
      redirect_to @survey
    else
      render 'new'
    end
  end

  def show
    @survey = Survey.find(params[:id])
    @comments = @survey.comments.order(created_at: :desc)
    @comment = @survey.comments.build
    @vote = @survey.votes.build
    @first_pic = @survey.pictures.find_by(picture_type: 1)
    @second_pic = @survey.pictures.find_by(picture_type: 2)
  end

  private
    def survey_params
      params.require(:survey).permit(:first_word,
                                     :second_word,
                                     :comparison_word,
                                     :sentence_type,
                                     :category)
    end
end
