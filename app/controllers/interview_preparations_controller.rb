class InterviewPreparationsController < ApplicationController
def index
end

def new

end

def create

end

  def show
    @interview_preparation = InterviewPreparation.find(params[:id])
  end
end
