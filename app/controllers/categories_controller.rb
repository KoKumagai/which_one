class CategoriesController < ApplicationController
  def all
    @surveys = Survey.page(params[:page]).per(15).order(created_at: :desc)
    render 'surveys/index'
  end

  def person
    @surveys = Survey.page(params[:page]).per(15).where(category: 1).order(created_at: :desc)
    render 'surveys/index'
  end

  def politics
    @surveys = Survey.page(params[:page]).per(15).where(category: 2).order(created_at: :desc)
    render 'surveys/index'
  end

  def sport
    @surveys = Survey.page(params[:page]).per(15).where(category: 3).order(created_at: :desc)
    render 'surveys/index'
  end

  def technology
    @surveys = Survey.page(params[:page]).per(15).where(category: 4).order(created_at: :desc)
    render 'surveys/index'
  end

  def interest
    @surveys = Survey.page(params[:page]).per(15).where(category: 5).order(created_at: :desc)
    render 'surveys/index'
  end

  def funny
    @surveys = Survey.page(params[:page]).per(15).where(category: 6).order(created_at: :desc)
    render 'surveys/index'
  end

  def anime
    @surveys = Survey.page(params[:page]).per(15).where(category: 7).order(created_at: :desc)
    render 'surveys/index'
  end

  def game
    @surveys = Survey.page(params[:page]).per(15).where(category: 8).order(created_at: :desc)
    render 'surveys/index'
  end

  def adult
    @surveys = Survey.page(params[:page]).per(15).where(category: 9).order(created_at: :desc)
    render 'surveys/index'
  end

  def other
    @surveys = Survey.page(params[:page]).per(15).where(category: 10).order(created_at: :desc)
    render 'surveys/index'
  end
end
