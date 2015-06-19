class ChosenAnswer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  belongs_to :question_answers
  belongs_to :survey_taker

end
