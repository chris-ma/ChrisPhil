class CreateYouTubes < ActiveRecord::Migration
  def change
    create_table :you_tubes do |t|
      t.string :link
      t.string :title
      t.string :author
      t.string :duration
      t.integer :likes
      t.integer :dislikes

      t.timestamps null: false
    end
  end
end
