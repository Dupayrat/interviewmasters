class InterviewPreparationsController < ApplicationController
  def index
    @interview_preparations = current_user.interview_preparations
  end

  def new

  end

  def create

<<<<<<< HEAD
  def show
    @interview_preparation = InterviewPreparation.find(params[:id])
=======
>>>>>>> master
  end
end
