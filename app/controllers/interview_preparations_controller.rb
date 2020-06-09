require 'json'
require 'open-uri'
require 'nokogiri'
require 'google_search_results'


class InterviewPreparationsController < ApplicationController
before_action :set_interview_preparation, only: [:show, :edit, :update]

  def index
    @interview_preparations = current_user.interview_preparations
  end

  def edit
  end

   def update
    @interview_preparation.update(interview_preparation_params)
    redirect_to interview_preparation_path(@interview_preparation)
  end

  def show

    # -------------------
    # VIDEOS OF (COMPANY)
    # -------------------

    #@company_videos = []

    # urls = [
    #   "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{@interview_preparation.company}%20ceo&type=video&relevanceLanguage=FR&key=#{ENV.fetch('YOUTUBE_API_KEY')}&maxResults=2",
    #   "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{@interview_preparation.company}%20Interview&type=video&relevanceLanguage=FR&key=#{ENV.fetch('YOUTUBE_API_KEY')}&maxResults=2",
    #   "https://www.googleapis.com/youtube/v3/search?part=snippet&q=#{@interview_preparation.company}%20start%20up&type=video&relevanceLanguage=FR&key=#{ENV.fetch('YOUTUBE_API_KEY')}&maxResults=2"
    # ]
    #   urls.each do |url|
    #     json = JSON.parse(open(url).read)
    #     @company_videos << json["items"].map do |video|
    #       {
    #       title: video["snippet"]["title"],
    #       thumbnails: video["snippet"]["thumbnails"]["default"]["url"],
    #       url: "https://www.youtube.com/watch?v=#{video["id"]["videoId"]}"
    #        }
    #     end
    #   end

    # ------------------
    # ARTICLES (COMPANY)
    # ------------------

    @company_articles = []
    doc = open("https://news.google.com/rss/search?q=#{@interview_preparation.company}&hl=fr&gl=FR&ceid=FR:fr")
    doc_json = Hash.from_xml(doc)

    @company_articles = []<< doc_json["rss"]["channel"]["item"][0..5].map do |item|
     {
      title: item["title"],
      url: item["link"],
      source: item["source"],
      publication_date: item["pubDate"]
    }
    end

    # ------------------
    # CANDIDATE PREPARATION (COMPANY QUESTIONS)
    # ------------------

    # QUESTIONS 1/4

    @questions1on4 = [] << @interview_preparation.candidate_works.build(question: "Why was #{@interview_preparation.company} created?")
    @questions1on4 << @interview_preparation.candidate_works.build(question: "What are #{@interview_preparation.company} 12 / 18 month objectives?")
    @questions1on4 << @interview_preparation.candidate_works.build(question: "What are #{@interview_preparation.company} recents achievements?")
    @questions1on4 << @interview_preparation.candidate_works.build(question: "What are #{@interview_preparation.company} challenges?")

    # QUESTIONS 2 /4

    @questions2on4 = [] << @interview_preparation.candidate_works.build(question: "What are #{@interview_preparation.company} values & culture?")
    @questions2on4 << @interview_preparation.candidate_works.build(question: "What attracts me in #{@interview_preparation.company}'s product or industry?")
    @questions2on4 << @interview_preparation.candidate_works.build(question: "What are the challenges / skills I'd like to develop within #{@interview_preparation.company}?")
    @questions2on4 << @interview_preparation.candidate_works.build(question: "Which personal story will I tell about my motivation for #{@interview_preparation.company}?")

    # QUESTIONS 3 /4

    @questions3on4 = [] << @interview_preparation.candidate_works.build(question: "What value added does #{@interview_preparation.company} bring to the market?")
    @questions3on4 << @interview_preparation.candidate_works.build(question: "Where does #{@interview_preparation.company} stand in terms of competition?")
    @questions3on4 << @interview_preparation.candidate_works.build(question: "What is #{@interview_preparation.company} business model?")
    @questions3on4 << @interview_preparation.candidate_works.build(question: "What is #{@interview_preparation.company} vision, mission & ambition?")


    # QUESTIONS 4 /4

    @questions4on4 = [] << @interview_preparation.candidate_works.build(question: "SEE THE BIG PICTURE : ask about #{@interview_preparation.company} vision, values, objectives?")
    @questions4on4 << @interview_preparation.candidate_works.build(question: "STEP IN: ask about the job (challenges, objectives or pitfalls, team)")
    @questions4on4 << @interview_preparation.candidate_works.build(question: "MAKE IT PERSONAL : ask the interviewer about himself / herself")
    @questions4on4 << @interview_preparation.candidate_works.build(question: "BROADEN VIEW : question #{@interview_preparation.company} market conditions, competition, clients")

    # ------------------------------------
    # OLD --FREQUENTLY ASKED QUESTIONS (COMPANY)
    # ------------------------------------

  #   @company_questions = []
  #   company = @interview_preparation.company.downcase.gsub(/\s/, '-')
  #   doc = Nokogiri::HTML(URI.open("https://fr.glassdoor.ch/Entretien/manor-questions-entretien-d-embauche-SRCH_KE0,5.htm"))
  #   doc.search('.questionText').each do |element|
  #     @company_questions << element.text
  #   end

    # ------------------------------------
    # SIMILAR PROFILES
    # ------------------------------------

    params = {
        q: "#{@interview_preparation.job} site:linkedin.com/in",
        location: "Switzerland",
        hl: "en",
        gl: "ch",
        google_domain: "google.com",
        api_key: ENV.fetch('SERAPI_API_KEY')
    }

    client = GoogleSearchResults.new(params)
    @hash_results = client.get_hash
  end

  def new
    @interview_preparation = InterviewPreparation.new
    @interview_preparation.missions.build(label: "Main mission")
    @interview_preparation.missions.build(label: "Mission 2")
    @interview_preparatxion.missions.build(label: "Mission 3")

    @interview_preparation.hardskills.build(label: "Hard skill expected - 1")
    @interview_preparation.hardskills.build(label: "Hard skill expected - 2")
    @interview_preparation.hardskills.build(label: "Hard skill expected - 3")
  end

  def create
    @interview_preparation = InterviewPreparation.new(interview_preparation_params)
    @interview_preparation.user = current_user

    if @interview_preparation.save
      redirect_to interview_preparation_path(@interview_preparation)
    else
      render :new
    end
  end

  private

  def set_interview_preparation
     @interview_preparation = InterviewPreparation.find(params[:id])
  end

  def interview_preparation_params
    params.require(:interview_preparation).permit(
    :company,
    :job,
    :interview_date,
    :experience_expectation,
    missions_attributes: [:id, :name, :label],
    hardskills_attributes: [:id, :hard_skill, :label],
    candidate_works_attributes: [:id, :question, :answer]
    )
  end
end
