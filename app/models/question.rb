class Question < ActiveRecord::Base

  belongs_to :survey

  has_many :question_answers
  has_many :chosen_answers

end
