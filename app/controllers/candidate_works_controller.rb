class CandidateWorksController < ApplicationController
  def update
    @interview_preparation = InterviewPreparation.find(params[:interview_preparation_id])
    @candidate_work = CandidateWork.find(params[:id])
    @candidate_work.answer = params[:candidate_work][:answer]

    if @candidate_work.save
      redirect_to interview_preparation_path(@interview_preparation)
    else
      render 'interview_preparations/show'
    end
  end

  private

  def candidate_work_params
    params.require(:candidate_work).permit(
      :question,
      :answer
    )
  end
end
