class InterviewPreparationsController < ApplicationController
  def index
    @interview_preparations = current_user.interview_preparations
  end

  def new

  end

  def create

  end

  def show
    @interview_preparation = InterviewPreparation.find(params[:id])
  end
end
