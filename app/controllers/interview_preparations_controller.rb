class InterviewPreparationsController < ApplicationController
  def index
    @interview_preparations = InterviewPreparation.all
  end

  def new

  end

  def create

  end
end
