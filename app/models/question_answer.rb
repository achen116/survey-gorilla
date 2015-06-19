class QuestionAnswer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :question
  has_many :chosen_answers

  # validates :question, presence: true

end
