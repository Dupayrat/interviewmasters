class Softskill < ApplicationRecord
  belongs_to :interview_preparation
  attr_accessor :label
end
