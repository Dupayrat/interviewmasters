class InterviewPreparation < ApplicationRecord
  belongs_to :user
  has_many :missions, dependent: :destroy
  accepts_nested_attributes_for :missions

end
