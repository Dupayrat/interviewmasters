class CandidateWork < ApplicationRecord
  belongs_to :interview_preparation
  validates :question, uniqueness: { scope: :answer}
end
