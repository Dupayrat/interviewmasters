class InterviewPreparation < ApplicationRecord
  belongs_to :user
  has_many :missions, dependent: :destroy
  accepts_nested_attributes_for :missions

  has_many :hardskills, dependent: :destroy
  accepts_nested_attributes_for :hardskills

  has_many :candidate_works, dependent: :destroy
  accepts_nested_attributes_for :candidate_works

  validates :company, :job, :interview_date, :experience_expectation, presence: true

  after_create :create_candidate_work

  has_many :challenges, dependent: :destroy

  has_many :softskills, dependent: :destroy
  accepts_nested_attributes_for :softskills

  def create_candidate_work
    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "Why was #{self.company} created?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "What are #{self.company} 12 / 18 months objectives?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "What are #{self.company} recents achievements?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "What are #{self.company} challenges?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "What are #{self.company} values & culture?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "What attracts me in #{self.company}'s product or industry?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "What are the challenges / skills I'd like to develop within #{self.company}?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "Which personal story will I tell about my motivation for #{self.company}?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "What value added does #{self.company} bring to the market?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "Where does #{self.company} stand in terms of competition?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "What is #{self.company} vision, mission & ambition?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "SEE THE BIG PICTURE : ask about #{self.company} vision, values, objectives?"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "BROADEN VIEW : question #{self.company} market conditions, competition, clients"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "STEP IN: ask about the job (challenges, objectives or pitfalls, team within #{self.company})"
    candidate_work.save!

    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "MAKE IT PERSONAL : ask the interviewer about his career at / before #{self.company}"
    candidate_work.save!
  end

end
