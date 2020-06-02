class InterviewPreparationsController < ApplicationController
  def index
    @interview_preparations = current_user.interview_preparations
  end

  def new

  end

  def create

  end
end
