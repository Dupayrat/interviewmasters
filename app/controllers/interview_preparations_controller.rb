require 'json'
require 'open-uri'

class InterviewPreparationsController < ApplicationController
  def index
    @interview_preparations = current_user.interview_preparations
  end

  def show
    @interview_preparation = InterviewPreparation.find(params[:id])

    @company_videos = []
    urls = [
      "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{@interview_preparation.company}%20ceo&type=video&relevanceLanguage=FR&key=#{ENV.fetch('YOUTUBE_API_KEY')}&maxResults=2",
      "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{@interview_preparation.company}%20Interview&type=video&relevanceLanguage=FR&key=#{ENV.fetch('YOUTUBE_API_KEY')}&maxResults=2",
      "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{@interview_preparation.company}%20start%20up&type=video&relevanceLanguage=FR&key=#{ENV.fetch('YOUTUBE_API_KEY')}&maxResults=2"
    ]
      urls.each do |url|
        json = JSON.parse(open(url).read)
        @company_videos << json["items"].map do |video|
          {
          title: video["snippet"]["title"],
          thumbnails: video["snippet"]["thumbnails"]["default"]["url"],
          url: "https://www.youtube.com/watch?v=#{video["id"]["videoId"]}"
           }
        end
      end
  end

  def new
    @interview_preparation = InterviewPreparation.new
    @interview_preparation.missions.build(label: "Mission principale")
    @interview_preparation.missions.build(label: "Mission 2")
    @interview_preparation.missions.build(label: "Mission 3")

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
    params.require(:interview_preparation).permit(
    :company,
    :job,
    :interview_date,
    :experience_expectation,
    missions_attributes: [:id, :name]
    )
  end
end
