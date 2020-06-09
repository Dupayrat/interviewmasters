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

  def create_candidate_work
    candidate_work = CandidateWork.new
    candidate_work.interview_preparation = self
    candidate_work.question = "Why was #{self.company} created?"
    candidate_work.save!
  end

end
