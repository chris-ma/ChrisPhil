class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|

      t.string :provider_url
      t.string :description
      t.string :title
      t.string :author_name
      t.integer :height
      t.integer :width
      t.string :html
      t.integer :thumbnail_width
      t.string :provider_name
      t.string :duration
      t.string :thumbnail_url
      t.string :media
      t.string :author_url
      t.boolean :public 
      
      t.timestamps null: false
    end
  end
end
