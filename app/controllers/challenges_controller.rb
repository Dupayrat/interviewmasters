class ChallengesController < ApplicationController
  def create
    done_challenge = Challenge.new(name: params[:name], statut: 'Done', interview_preparation_id: params[:interview_preparation_id])
    done_challenge.save
    redirect_to interview_preparation_path(params[:interview_preparation_id])
  end
end
