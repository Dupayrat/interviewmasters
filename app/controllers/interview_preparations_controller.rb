class InterviewPreparationsController < ApplicationController
  def index
  end

  def new
  @interview_preparation = InterviewPreparation.new
  end

  def create
    @interview_preparation = InterviewPreparation.new(interview_preparation_params)
    @interview_preparation.user = current_user
    if @interview_preparation.save!
      redirect_to interview_preparation_path(@interview_preparation)
    else
      render :new
    end
  end

  private

  def interview_preparation_params
    params.require(:interview_preparation).permit(:company, :job, :interview_date, :experience_expectation)
  end

end
