class InterviewPreparation < ApplicationRecord
  belongs_to :user
  has_many :missions, dependent: :destroy
  accepts_nested_attributes_for :missions

  has_many :hardskills, dependent: :destroy
  accepts_nested_attributes_for :hardskills

  validates :company, :job, :interview_date, :experience_expectation, presence: true
end
