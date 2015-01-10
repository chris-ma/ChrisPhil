class CreateLessonsLearnlists < ActiveRecord::Migration
  def change
    create_table :lessons_learnlists do |t|
      t.integer :lesson_id
      t.integer :learnlist_id

      t.timestamps null: false
    end
  end
end
