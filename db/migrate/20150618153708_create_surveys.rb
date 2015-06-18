class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :creator_id
      t.string :survey_name

      t.timestamps
    end
  end
end
