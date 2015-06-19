class CreateSurveyTakers < ActiveRecord::Migration
  def change
    create_table :survey_takers do |t|
      t.integer :survey_id
      t.integer :user_id

      t.timestamps
    end
  end
end
