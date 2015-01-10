class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.text :description
      t.boolean :public
      t.integer :length
      
      t.timestamps null: false
    end
  end
end
