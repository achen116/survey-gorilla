class CreateChosenAnswers < ActiveRecord::Migration
  def change
    create_table :chosen_answers do |t|
      t.integer :survey_takers_id
      t.integer :question_id
      t.integer :question_answer_id

      t.timestamps
    end
  end
end
