class InterviewPreparation < ApplicationRecord
  belongs_to :user
  has_many :missions
  accepts_nested_attributes_for :missions

end
