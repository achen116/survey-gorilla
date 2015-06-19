class SurveyTaker < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :survey
  belongs_to :user

  has_many :chosen_answers
end
