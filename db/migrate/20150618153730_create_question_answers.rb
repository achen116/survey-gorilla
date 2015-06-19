class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :question_id
      t.text  :the_answer
      t.integer :times_chosen

      t.timestamps
    end
  end
end
